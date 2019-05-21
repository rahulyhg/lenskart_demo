<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Razorpay\Api\Api;
use Config;
use App\Subscription;
use App\SubscriptionLink;
use App\FreeDay;
use DB;
use Razorpay\Api\Errors\BadRequestError;

class PaymentsController extends Controller
{
    public function checkout()
    {
        if(!empty(session('customer')))
        {
            //setting default timezone
            date_default_timezone_set('Asia/Kolkata'); 

            $customer = session('customer');
            $product = session('product');
            $plan = session('plan');
           
            $shipping = session('shipping_amount');
            $total = session('total');
            $first = session('first');
            $razorpay_customer = session('razor_customer');

            //return $first ? "New ". $customer['id']: "OLD". $customer['id'];
            $freedays = FreeDay::where('plan_id', $plan['id'])->first();
            $subscription = session('subscription');
             //fetching the RazorPay Key and Secret from local file
            $key = Config::get('constants.url.razorpay_key');
            $secret = Config::get('constants.url.razorpay_secret');

            $api = new Api($key, $secret);

            $customer_name = $customer['first_name'] . " " . $customer['last_name'];
            $customer_email = $customer['email'];
            $customer_phone = $customer['phone'];
             
 
            $error = "";

               

            if($first)
            {
                try{

                    //create a new customer on razor pay
                    if(empty(session('razor_customer'))){
                        $razorpay_customer = $api->customer->create(array(
                            'name' => $customer_name,
                            'email' => $customer_email,
                            'contact' => $customer_phone
                        ));
                    }

                    $total = $shipping;
    
                    //add 10 days to date
                    $date = date('Y-m-d', mktime(0, 0, 0, date('m'), date('d') + $freedays['days'], date('Y')));
    
                    $timeNew = strtotime($date);
    
                    $s = array(
                        'plan_id' => $plan['id'], 
                        'customer_notify' => 1, 
                        'total_count' => 6, 
                        'start_at' => $timeNew,  
                        'customer_id' => $razorpay_customer['id'],                      
                        'addons' => array(
                            array(
                                'item' => array(
                                    'name' => 'Shipping Charges', 
                                    'amount' => $total * 100, 
                                    'currency' => 'INR'
                                )
                            )
                    ));
                    if(empty(session('subscription')))
                        $subscription  = $api->subscription->create($s); 
                }
                catch(BadRequestError $err){
                    $err_message = $err->getMessage();
                    if($err_message == "Customer already exists for the merchant")
                    {
                        $first = false;                    
                    }
                }           

               
            }
            else
            {    
                // get details of existing customer
                $customer_details = SubscriptionLink::where('plan_id' , $plan['id'])
                ->where('shopify_customer_id', $customer['id'])->first();

                $razorpay_customer = $customer_details['razor_customer_id'];  
                $subscription_id = $customer_details['subscription_id'];

                //return $subscription_id;
                $check = Subscription::find($subscription_id);
                
                if($check['status'] == 'active' || $check['status'] == 'authenticated')
                {
                    //return $check['status'];
                    $error = "You already have an active subscription for the product. Go to the Accounts Page to change your subscription plan";
                    /* $total = $plan['item_amount'];
                    $shipping = 0;
                    $date_to_start = strtotime("+1 days", $check['end_at']);
                    $s = array(
                        'plan_id' => $plan['id'], 
                        'customer_notify' => 1, 
                        'customer_id' => $razorpay_customer, 
                        'total_count' => 6, 
                        'start_at' => $date_to_start                    
                    );
                    if(empty(session('subscription')))
                        $subscription  = $api->subscription->create($s);  */
                }              
            }
            
           

            $data = array(
                'customer' => $customer,
                'product' => $product,
                'plan' => $plan,
                'first' => $first,
                'shipping_amount' => $shipping,
                'total' => $total,
                'subscription' => $subscription,
                'key' => $key,
                'error' => $error,
                'razor_customer' => $razorpay_customer
            );

            session($data);
            return view('pages.payment')->with($data);
        }
        else
            return "Error Occured";
    }


    public function verify($razorpayPaymentId, $subscriptionId, $razorpaySignature)
    {
        $secret = Config::get('constants.url.razorpay_secret');

        $expectedSignature = hash_hmac("SHA256", $razorpayPaymentId . '|' . $subscriptionId, $secret);

        $key = Config::get('constants.url.razorpay_key');
        $secret = Config::get('constants.url.razorpay_secret');

        $api = new Api($key,$secret);

        $subscription = $api->subscription->fetch($subscriptionId);
        if ($expectedSignature === $razorpaySignature)
        {
            $insertArr = array();
            foreach($subscription as $key => $sub)
            {    
                if($key == 'notes' || $key == 'addons')
                    $sub = json_encode($sub);          
                $insertArr[$key] = $sub;
            }
            $insertArr['payment_id'] = $razorpayPaymentId;
            DB::table('subscriptions')->insert($insertArr);     
            
            $customer = session('customer');
            $product = session('product');

            //add the entry in the databse to link the subscription, customer and product
            $slink = new SubscriptionLink();
            $slink->shopify_customer_id = $customer['id'];
            $slink->product_id = $product['id'];
            $slink->subscription_id = $subscription['id'];
            $slink->plan_id = $subscription['plan_id'];
            $slink->payment_id = $razorpayPaymentId;
            $slink->razor_customer_id = $subscription['customer_id'];
            $slink->save();


            echo "<script>alert(''Subscription Created Successfully)</script>";
        }
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Razorpay\Api\Api;
use Config;
use App\Subscription;
use App\Razor_Customer;
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
            $razor_customer = session('razor_customer');

            //return $first ? "New ". $customer['id']: "OLD". $customer['id'];
            $freedays = FreeDay::where('plan_id', $plan['id'])->first();
            $subscription = session('subscription');
            
            if($first)
            {
                
                //fetching the RazorPay Key and Secret from local file
                $key = Config::get('constants.url.razorpay_key');
                $secret = Config::get('constants.url.razorpay_secret');

                $api = new Api($key, $secret);

                $total = $shipping;

                //add 10 days to date
                $date = date('Y-m-d', mktime(0, 0, 0, date('m'), date('d') + $freedays['days'], date('Y')));

                $timeNew = strtotime($date);

                $s = array(
                    'plan_id' => $plan['id'], 
                    'customer_notify' => 1, 
                    'total_count' => 6, 
                    'start_at' => $timeNew,  
                    'customer_id' => $razor_customer['id'],                      
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
            else
            {    
                // get details of existing customer
                $razor_customer = Razor_Customer::where('shopify_customer_id', $customer['id'])->get();

                $subs = Subscription::where('customer_id', $razor_customer['id'])
                ->where('plan_id', $plan['id'])->first();

                $subscription_id = $subs['id'];

                //return $subscription_id;
                $check = Subscription::find($subscription_id);
                
                if($check['status'] == 'active' || $check['status'] == 'authenticated')
                {
                    $error = "You already have an active subscription for the product. Go to the Accounts Page to change your subscription plan";                  
                } 
                else if($check['status'] == 'cancelled' || $check['status'] == 'expired')
                {
                    $error = "You already have a cancelled/expired subscription for the Product. You need to create a new Subscription";                  
                }
                else
                {
                    $error = "You already have an active subscription for the product. Go to the Accounts Page to change your subscription plan";                  
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
                'error' => isset($error) ? $error : null,
                'razor_customer' => $razor_customer
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

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Razor_Customer;
use App\Plan;
use App\Product;
use App\Order;
use App\Customer;
use Razorpay\Api\Api;
use Config;
use App\Subscription;
use Ixudra\Curl\Facades\Curl;
use Razorpay\Api\Errors\BadRequestError;
use PHPUnit\Framework\Constraint\Exception;

class SubscriptionController extends Controller
{
    //function to handle the input from frontend
    public function subscribe($cust_id, $prod_id, $plan_id)
    {
        $customer = Customer::find($cust_id);
        $product = Product::find($prod_id);
        $plan = Plan::find($plan_id);

   
        if(!empty($customer)){
            if(!empty($product)){
                if(!empty($plan)){
                    $data = array(
                        'customer' => $customer,
                        'product' => $product,
                        'plan' => $plan
                    );

                    session(['customer' => $customer,
                    'product' => $product,
                    'plan' => $plan]);

                    return view('pages.subscribe')->with($data);                   
                }
                else{
                    $error = "Plan does not exist";
                }
            }
            else{
                $error = "Product does not exist";
            }
        }
        else{
            $error = "Customer does not exist";
        }

        return view('pages.subscribe')->with('error', $error);
    }

    public function confirm($cust_id, $prod_id, $plan_id ,$first = 0)
    {
        $customer = Customer::find($cust_id);
        $product = Product::find($prod_id);
        $plan = Plan::find($plan_id);

        //fetch this from the backend
        $addDays = 10;
        $key = Config::get('constants.url.razorpay_key');
        $secret = Config::get('constants.url.razorpay_secret');


        $razorpay_url = Config::get('constants.url.razor_auth_url');
        if(!empty($customer)){
            if(!empty($product)){
                if(!empty($plan)){

                    $subscription = empty(session('subscription')) ? "" : session('subscription');
                    $api = new Api($key,$secret);
                    if($first)
                    {                        
                        $shipping_fee = 100;
                        $total = $shipping_fee;
                        date_default_timezone_set('Asia/Kolkata'); 
                        //add 10 days to date
                        $date = date('Y-m-d', mktime(0, 0, 0, date('m'), date('d') + $addDays, date('Y')));

                        $timeNew = strtotime($date);

                        if(empty($subscription))
                        {   
                             $s = array(
                                'plan_id' => $plan['id'], 
                                'customer_notify' => 1, 
                                'total_count' => 6, 
                                'start_at' => $timeNew, 
                                'addons' => array(
                                    array(
                                        'item' => array(
                                            'name' => 'Shipping Charges', 
                                            'amount' => $total * 100, 
                                            'currency' => 'INR'
                                        )
                                    )
                            ));
                            $subscription  = $api->subscription->create($s);                         
                        }
                    }
                    else{
                        date_default_timezone_set('Asia/Kolkata'); 
                        // add current date to date                        
                        $shipping_fee = 0;
                        $total = $plan['item_amount'];
                        if(empty($subscription))
                        {
                            $s = array(
                                'plan_id' => $plan['id'], 
                                'customer_notify' => 1, 
                                'total_count' => 6, 
                                'start_at' => time()                    
                            );
                            $subscription  = $api->subscription->create($s);
                        }
                        //$payment  = $api->payment->fetch($id)->capture(array('amount' => $amount));
                    }    
 
                    $data = array(
                        'customer' => $customer,
                        'product' => $product,
                        'plan' => $plan,
                        'first' => $first,
                        'shipping_amount' => $shipping_fee,
                        'total' => $total,
                        'subscription' => $subscription,
                        'key' => $key 
                    );

                    session($data);

                    return view('pages.shipping')->with($data);                   
                }
                else{
                    $error = "Plan does not exist";
                    return $plan['id'];    
                }
            }
            else{
                $error = "Product does not exist";
            }
        }
        else{
            $error = "Customer does not exist";
        }
    }

    //handling the webhooks
    public function webhook(Request $request)
    {
        $data = json_decode($request->payload, true);
        $payload = $data['payload'];

        if($data['event'] == 'subscription.activated')
        {
            $subscription = $payload['subscription']['entity'];
            //$payment = $payload['payment'];

            $sub_update = Subscription::find($subscription['id']);
            $sub_update->status = "active";
            $sub_update->save();            
        }
        else if($data['event'] == 'subscription.charged')
        {
            $subscription = $payload['subscription']['entity'];
            //$payment = $payload['payment'];

            $sub_update = Subscription::find($subscription['id']);
            $sub_update->status = "active";
            $sub_update->save();            
        }
    }




    //function to handle input from frontend with required fields
    public function shipping($customer_id, $plan_id)
    {
        //validate the request coming from frontend if post
        /* $this->validate($request, [
            "customer_id" => "required|numeric",
            "product_id" => "required|numeric",
            "plan_id" => "required"
        ]);

        
        $customer_id = $request->input('customer_id');
        $product_id = $request->input('product_id');
        $plan_id = $request->input('plan_id'); */


        //fetch the customer details from the database
        $customer = Customer::find($customer_id);                
        $plan = Plan::find($plan_id);
        $product = Product::find($plan['product_id']);
        $first = true;
        $shipping_fee = 100;


        if(!empty($customer) && !empty($product) && !empty($plan))
        {

            $razor_customer = Razor_Customer::where('shopify_customer_id' , $customer['id'])->exists();
           
            if(!empty($razor_customer))
            {        
                $subs = Subscription::where('customer_id', $razor_customer['id'])
                ->where('plan_id', $plan['id']);
                if(!empty($subs))
                    $first = false;                
                //return $first ? "New ". $customer['id']: "OLD". $customer['id'];
            }
            else{
                try{

                    //fetching the RazorPay Key and Secret from local file
                    $key = Config::get('constants.url.razorpay_key');
                    $secret = Config::get('constants.url.razorpay_secret');
                    $api = new Api($key, $secret);

                    $customer_name = $customer['first_name'] . " " . $customer['last_name'];
                    $customer_email = $customer['email'];
                    $customer_phone = $customer['phone'];
            

                    $razor_customer = $api->customer->create(array(
                        'name' => $customer_name,
                        'email' => $customer_email,
                        'contact' => $customer_phone
                    ));
                    
                    $new_customer = new Razor_Customer();
                    $new_customer->id = $razor_customer->id;
                    $new_customer->shopify_customer_id = $customer['id'];
                    $new_customer->name = $customer_name;
                    $new_customer->email = $customer_email;
                    $new_customer->contact = $customer_phone;
                    $new_customer->save();
                    
                }catch(BadRequestError $err){
                    $error = $err->getMessage();  

                }    
            }

            if($first)
                $total = $shipping_fee;
            else
                $total = $plan['item_amount'];

            $data = array(
                'customer' => $customer,
                'product' => $product,
                'plan' => $plan,
                'total' => $total,
                'first' => $first,
                'shipping_amount' => $shipping_fee,
                'razor_customer' => $razor_customer
            );


            session($data);

            //return session('first') ? "New ". $customer['id']: "OLD". $customer['id'];
            return view('pages.shipping')->with($data);
        }
        else
        {
            return "Error Occured";
        }
    }

    public function cancel($customer_id, $subscription_id)
    {
        try{
        
        $customer = Customer::find($customer_id);
       
        /* $subscription_id = SubscriptionLink::where('shopify_customer_id', $customer_id)
        ->where('plan_id', $plan['id'])
        ->where('product_id', $product['id'])
        ->get();
        */ 


        $key = Config::get('constants.url.razorpay_key');
        $secret = Config::get('constants.url.razorpay_secret');
        $api = new Api($key, $secret);
        $subscription = $api->subscription->fetch($subscription_id);
        
       
        if(!empty($subscription))
        {
            $key = Config::get('constants.url.razorpay_key');
            $secret = Config::get('constants.url.razorpay_secret');

            $api = new Api($key, $secret);

            //$options = ['cancel_at_cycle_end' => 1];

            $sub = $api->subscription->fetch($subscription_id)->cancel();
    
            $ret = [
                'RESULT' => 'SUCCESS'
            ]; 
            return json_encode($ret['RESULT']);
        }
        }catch(Exception $err)
        {
            $ret = [
                'RESULT' => 'FAIL'
            ]; 
            return json_encode($ret['RESULT']);
        }
    }

    public function renew($customer_id, $subscription_id)
    {
        //$subscription_db = Subscription::find($subscription_id);

        $key = Config::get('constants.url.razorpay_key');
        $secret = Config::get('constants.url.razorpay_secret');
        $api = new Api($key, $secret);
        $subscription = $api->subscription->fetch($subscription_id);

        if(!empty($subscription))
        {        

            if($subscription->status == "active" || $subscription->status == "authenticated")
            {
                $data['error'] = "The Subscripiton is already Active you do not need to Renew it";
            }
            else if($subscription->status == "pending" || $subscription->status == "completed")
            {
                $key = Config::get('constants.url.razorpay_key');
                $secret = Config::get('constants.url.razorpay_secret');

                $api = new Api($key, $secret);

                $options = ['cancel_at_cycle_end' => 1];

                $subscription = $api->subscription->fetch($subscription_id)->cancel($options);
            }
            else if($subscription->status == "halted" )
            {
                $data['error'] = "We had tried to grab the payment for the subscription but failed after consecutive attempts. Please update the Card Details. So that you can enjoy continued subscription";
            }
            else
            {
                $data['error'] = "The Subscription has been cancelled or is invalid. You need to start a new subscription";
            }

            return json_encode($data);
        }
        else
        {
            return "Invalid Subscription ID";
        }
    }

    public function get_subscriptions_by_customer($customer_id)
    {
        if(!empty($customer_id))
        {
            $razor_customer = Razor_Customer::where('shopify_customer_id', $customer_id)->get();
            
            if(!empty($razor_customer)){
                $razor_customer_id = $razor_customer['id'];
                $subscriptions = Subscription::where('customer_id', $razor_customer_id);

                $ret = [
                    'RESULT' => 'SUCCESS',
                    'subscriptions' => $subscriptions
                ]; 
                return json_encode($ret);
            }
            else{
                $ret = [
                    'RESULT' => 'FAIL'
                ]; 
                return json_encode($ret);
            }

        }
        $ret = [
            'RESULT' => 'FAIL'
        ]; 
        return json_encode($ret);
    }
}

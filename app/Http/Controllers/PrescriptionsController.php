<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Prescription;
use Illuminate\Http\UploadedFile;
use Config;
use Razorpay\Api\Api;
use Ixudra\Curl\Facades\Curl;
class PrescriptionsController extends Controller
{
    public function create()
    {    
        $customer = session('customer');
        return view("pages.prescription")->with('customer' , $customer);
    }

    public function store(Request $request)
    {

        $this->validate($request, [
            'prescription' => 'required|image|max:1999'
        ]);

        if($request->hasFile('prescription'))
        {
            $prescription = $request->file('prescription');
            $customer = session('customer');
            $customer_id = $customer['id'];

            $filename = pathinfo($prescription->getClientOriginalName() , PATHINFO_FILENAME)."_".time();

            $path = $request->prescription->storeAs('public/prescriptions', $filename);

            $pr = new Prescription();
            $pr->customer_id = $customer_id;
            $pr->name = $filename;
            $pr->path = $path;
            $pr->save();

            return "File Uploaded. Redirecting to Accounts Page";
            
        }

      

        

        
       

        /*  $destinationPath = 'prescriptions';
        $prescription->move($destinationPath,$prescription->getClientOriginalName());

      
        return $destinationPath; */
        //return redirect(url('payment/checkout'))      
    }

    public function displaydate()
    {

        // add 15 days to date
       // Set timezone 
        date_default_timezone_set('Asia/Kolkata'); 
        $timestamp = 1572460200;

        return date("d/m/Y h:i:s a", $timestamp);
    }

    public function getsub()
    {

        $key = Config::get('constants.url.razorpay_key');
        $secret = Config::get('constants.url.razorpay_secret');

        $api = new Api($key,$secret);
       
        $subscription = $api->subscription->fetch("sub_CWAm2iJdluLzPs");

        return $subscription['customer_id'];
    }

    public function clearsession()
    {
        session()->flush();
        return "Session Cleared";
    }

    public function createsub()
    {

        $shipping_fee = 500;
        $total = $shipping_fee;

                        // add 10 days to date
                        $date = date('Y-m-d', mktime(0, 0, 0, date('m'), date('d') + 10, date('Y')));

                        $timeNew = strtotime($date);
         $s = array(
            'plan_id' => "plan_CVKxrA1xXVEubO", 
            'customer_notify' => 1, 
            'total_count' => 6, 
            'customer_id' => 'cust_CXfwVyEt6Oi12e',
            'start_at' => $timeNew,
            'addons' => array(
                array(
                    'item' => array(
                        'name' => 'Shipping Charges', 
                        'amount' => $total, 
                        'currency' => 'INR'
                    )
                )
            )           
        );


        //fetching the RazorPay Key and Secret from local file
        $key = Config::get('constants.url.razorpay_key');
        $secret = Config::get('constants.url.razorpay_secret');
        $api = new Api($key, $secret);
        $subscription  = $api->subscription->create($s); 

       
      /*   $razorpay_url = Config::get('constants.url.razor_auth_url')."subscriptions";
        $curl = curl_init();
 */
 /* 
        $d = json_encode($s);
        $response = Curl::to($razorpay_url)
        ->withData($d)
        ->post();

        return $d;   */

       /*   curl_setopt_array($curl, array(
            CURLOPT_URL => $razorpay_url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_TIMEOUT => 30000,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => json_encode($s),
            CURLOPT_HTTPHEADER => array(
    	        // Set Here Your Requesred Headers
                'Content-Type: application/json',
            ),
        ));  */

 
      /*   $response = curl_exec($curl); */
      /*   $err = curl_error($curl); */

        return $subscription->customer_id; 

    }
}

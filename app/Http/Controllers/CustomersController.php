<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Customer;
use Config;
use DB;

class CustomersController extends Controller
{
    public function index()
    {
        $customers = Customer::all();
       
        return view('pages.customers')->with('customers' , $customers);
       
    }

    public function fetch_all()
    {
        $i = 1;
        while(true)
        {
            $customers_url = Config::get('constants.url.customers')."?page=".$i;
            
            $json = file_get_contents($customers_url);

            $customers = json_decode($json, true);

            if(!empty($customers['customers']))
            {
                $insertArr = array();
                foreach($customers['customers'] as $customer)
                {   
                    $exists = Customer::find($customer['id']);
                    if(empty($exists))
                    {
                        foreach($customer as $key => $value){
                            if($key == "addresses" || $key == "default_address" )
                            {
                            $value = json_encode($customer[$key]);
                            }
                            $insertArr[$key] = $value;
                        }
                        DB::table('customers')->insert($insertArr);
                    }
                    else{
                        
                        foreach($customer as $key => $value){
                            if($key == "addresses" || $key == "default_address" )
                            {
                            $value = json_encode($customer[$key]);
                            }
                            $insertArr[$key] = $value;
                        }
                        DB::table('customers')->where('id', $customer['id'])->update($insertArr);
                    }
                }
            }
            else
               break;
        }

        return "Insert Successful";
    }

    public function view_customers()
    {
        $customers_url = Config::get('constants.url.customers');
        $json = file_get_contents($customers_url);

        $customers = json_decode($json, true);
        if(!empty($customers['customers']))
        {
            return "<pre>". print_r($customers) ."</pre>";
        }
        else
        {
            return "hello";
        }
        
    }

    public function store($id)
    {
        $customer_url = Config::get('constants.url.base_url')."customers/".$id.".json";
        
        $json = file_get_contents($customer_url);

        $customer = json_decode($json, true);
 
        if(!empty($customer['customer']))
            {
                $insertArr = array();
                
                $exists = Customer::find($customer['customer']['id']);
                
                if(empty($exists))
                {
                    foreach($customer['customer'] as $key => $value)
                    {
                        if($key == "addresses" || $key == "default_address" )
                        {
                            $value = json_encode($value);
                        }
                        $insertArr[$key] = $value;
                    }
                    DB::table('customers')->insert($insertArr);    
                }  
                else
                    return "Already Exists";
            }
        return $customer;        
    }
}

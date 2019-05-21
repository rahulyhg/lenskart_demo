<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Config;
use DB;
use Razorpay\Api\Api;
use App\Product;
use App\Plan;

class PlansController extends Controller
{

    public function create()
    {
        return view('pages.plans');
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'name' => 'required',
            'product' => 'required|numeric',
            'amount' => 'required|numeric',
            'currency' => 'required',
            'period' => 'required',
            'interval' => 'required|numeric',
        ]);

        $name = $request->input('name');
        $product_id = $request->input('product');
        $amount = $request->input('amount');
        $currency = $request->input('currency');
        $period = $request->input('period');
        $interval = $request->input('interval');
        $description = $request->input('description');
        $notes = $request->input('notes');


        $key = Config::get('constants.url.razorpay_key');
        $secret = Config::get('constants.url.razorpay_secret');
        
        $api = new Api($key, $secret);
        $plan = $api->plan->create(array(
            'period' => $period, 
            'interval' => $interval, 
            'item' => array(
                'name' => $name, 
            
                'description' => $description, 
                'amount' => $amount * 100, 
                'currency' => $currency)));
        $this->plan_db_store($plan, $product_id);
    }


    public function plan_db_store($plan, $product_id)
    {
        if(!empty($plan) && !empty($product_id))
        {

            $plan = json_decode($plan, true);            
            $insertArr = array();

            $includes = array(
                "id" , "item.name" , "item.description", "item.amount", "item.currency" , "period" , "interval" , 
            );
        
            foreach ($plan as $key => $value) {
                # code...
                if($key == 'item')
                {
                    foreach ($value as $k => $v) {
                        if(in_array("item.$k" , $includes))
                            $insertArr["item_$k"] = $v; 
                    }
                }
                else if($key == 'notes')
                {
                    $value = json_encode($value);
                    $insertArr[$key] = $value;
                }
                else{
                    if(in_array($key , $includes))
                        $insertArr[$key] = $value;
                }
            }


            $prod = Product::find($product_id);
            if(!empty($prod))
                $insertArr['product_id'] = $product_id;
            else
            {
                $prod = app('App\Http\Controllers\ProductsController')->fetch($product_id);    
                $product_id = $prod['id'];
                $insertArr['product_id'] = $product_id;
            }

            DB::table('plans')->insert($insertArr);    

            return "<pre>".print_r($insertArr)."</pre>";
        }
    }

    public function fetch($id)
    {
        $plan_url = Config::get('constants.url.razor_auth_url')."plans/".$id;
        $json = file_get_contents($plan_url);

     
        $plan = json_decode($json, true);

        if(!empty($plan))
        {
            $insertArr = array();

            $includes = array(
                "id" , "item.name" , "item.description", "item.amount", "item.currency" , "period" , "interval" , 
            );
        
            foreach ($plan as $key => $value) {
                # code...
                if($key == 'item')
                {
                    foreach ($value as $k => $v) {
                        if(in_array("item.$k" , $includes))
                            $insertArr["item_$k"] = $v; 
                    }
                }
                else if($key == 'notes')
                {
                    $value = json_encode($value);
                    $insertArr[$key] = $value;
                }
                else{
                    if(in_array($key , $includes))
                        $insertArr[$key] = $value;
                }
            }

            $insertArr['product_id'] = $product_id;
            DB::table('plans')->insert($insertArr);    

            return "<pre>".print_r($insertArr)."</pre>";
        }
        else
        {

        }
    }

    public function product_plans($product_id)
    {        
        $plans = Plan::where('product_id', $product_id)->get();

        if(count($plans) > 0)
        {
            $data = array(
                "STATUS" => "SUCCESS",
                "plans" => $plans
            );
            return json_encode($data);
        }
        else
        {
            $data = array(
                "ERROR" => "No Plans Associated to the Product"
            );
            return json_encode($data);
        }
    }

}

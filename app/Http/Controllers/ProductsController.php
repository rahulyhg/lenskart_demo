<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Config;
use DB;

class ProductsController extends Controller
{
    public function store($id)
    {
        $product_url = Config::get('constants.url.base_url')."products/".$id.".json";
        $json = file_get_contents($product_url);

        $product = json_decode($json, true);

        $insertArr = array();
        foreach($product['product'] as $key => $value)
        {
            if($key == "variants" || $key == "options" || $key == "images" || $key == "image")
            {                
                /* foreach($value as $variant)
                {
                    $variantsArr = array();
                    foreach($variant as $k => $var)
                    {
                        $variantsArr[$k] = $var;
                    }
                    DB::table('products_variants')->insert($variantsArr);  
                } */

                $value = json_encode($value);
            }
            $insertArr[$key] = $value;
        }
        DB::table('products')->insert($insertArr);    

        return "<pre>".print_r($insertArr)."</pre>";
    }


    
    public function fetch($id)
    {
        $product_url = Config::get('constants.url.base_url')."products/".$id.".json";
        $json = file_get_contents($product_url);

        $product = json_decode($json, true);

        $insertArr = array();
        foreach($product['product'] as $key => $value)
        {
            if($key == "variants" || $key == "options" || $key == "images" || $key == "image")
            {                
                /* foreach($value as $variant)
                {
                    $variantsArr = array();
                    foreach($variant as $k => $var)
                    {
                        $variantsArr[$k] = $var;
                    }
                    DB::table('products_variants')->insert($variantsArr);  
                } */

                $value = json_encode($value);
            }
            $insertArr[$key] = $value;
        }
        return $insertArr;
    }
}

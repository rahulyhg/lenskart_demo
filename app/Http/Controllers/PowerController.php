<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\LensPower;

class PowerController extends Controller
{
    public function create()
    {
        $customer = session('customer');
        return view("pages.eyepower")->with('customer' , $customer);
    }

    public function store(Request $request)
    {
        $request->validate([

            "right_power" => 'required',
            "left_power" => 'required',

        ]);

        $right = $request->input('right_power');
        $left = $request->input('left_power');

        $customer = session('customer');
        $customer_id = $customer['id'];

        $exists = LensPower::find($customer_id);

        if(empty($exists))
        {
            $power = new LensPower();
            $power->customer_id = $customer_id;
            $power->power_right = $right;
            $power->power_left = $left;
            $power->save();      
        }
        else
        {
            $exists->power_right = $right;
            $exists->power_left = $left;
            $exists->save();        
        }
        return redirect(url('prescriptions/upload'));
        
    }
}

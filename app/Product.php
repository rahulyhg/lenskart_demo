<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    //allows the primary key to be as a non numeric value without being casted to int
    public $incrementing = false;
}

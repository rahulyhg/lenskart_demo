@extends('layouts.app')

@section('content')

<style>
  .no-js #loader { display: none;  }
  .js #loader { display: block; position: absolute; left: 100px; top: 0; }
  .se-pre-con {
      position: fixed;
      left: 0px;
      top: 0px;
      width: 100%;
      height: 100%;
      z-index: 9999;
      background: url('<?php echo asset('images/loader-64x/Preloader_2.gif');?>') center no-repeat #fff;
  } 
</style>

<div class="se-pre-con"></div>

<h1>Subscription</h1>

@if(isset($error))
<div class="alert alert-danger"> {{$error}}</div>
@endisset


<div class="row">
  <div class="col-lg-6">
    <h3>Customer Shipping Details</h3>

    @if(isset($customer['default_address']))
        <?php
            $def_address = json_decode($customer['default_address'] , true);
        ?>
       <label>Address 1: </label> {{$def_address['address1']}} <br>
       <label>Address 2: </label> {{$def_address['address2']}}<br>
       <label>City: </label> {{$def_address['city']}}<br>
       <label>Country: </label> {{$def_address['country']}}<br>
       <label>Customer Name: </label> {{$def_address['first_name']}} {{$def_address['last_name']}}<br>
       <label>Phone : </label> {{$def_address['phone']}}<br>
       <label>Province : </label> {{$def_address['province']}}<br>
       <label>PIN Code : </label> {{$def_address['zip']}}<br>
       <label>Phone : </label> {{$def_address['phone']}}<br>
    @endif

  </div>

  <div class="col-lg-6">
      <h3>Product Details</h3>
  
      
      @if(isset($product['title']))
        <label>Product Name : </label> {{$product['title']}} <br>
      @endif
      @if(isset($product['product_type']))
        <label>Product Type : </label> {{$product['product_type']}}<br>
      @endif
      @if(isset($product['vendor']))
        <label>Product Vendor : </label> {{$product['vendor']}}<br>
      @endif
    
      <h3>Plan Details</h3>
        
        @if(isset($plan['item_name']))
          <label>Plan Name : </label> {{$plan['item_name']}} <br>
        @endif
        @if(isset($plan['period']))
          <label>Plan Type : </label> {{$plan['period']}}<br>
        @endif
        @if(isset($plan['item_amount']))
            @if($first)
                <label>Plan Amount : </label><b>FREE</b><br>
            @else
                <label>Plan Amount : </label>{{$plan['item_currency']}} {{$plan['item_amount']}}<br>
            @endif          
        @endif

        @if($first)
            <label>Shipping Fee : </label>{{$plan['item_currency']}} {{$shipping_amount}}<br>
        @endif

        <hr>
            <h3>Order Total : {{$plan['item_currency']}} {{$total}}</h3> 

            <a href="{{url('payment/checkout')}}" class="btn btn-success float-right">Proceed To Checkout</a>
      </div>
  

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
<script>	

$(window).load(function() {
		// Animate loader off screen
		$(".se-pre-con").fadeOut("slow");;
	});

</script>
@endsection



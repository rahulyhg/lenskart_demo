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
  <div class="col-lg-4">
    <h3>Customer Details</h3>

    
    @if(isset($customer['first_name']))
      <label>Customer Name : </label> {{$customer['first_name']}} <br>
    @endif
    @if(isset($customer['email']))
      <label>Customer Email : </label> {{$customer['email']}}<br>
    @endif
    @if(isset($customer['phone']))
      <label>Customer Contact : </label> {{$customer['phone']}}<br>
    @endif
  </div>

  <div class="col-lg-4">
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
    </div>


    <div class="col-lg-4">
        <h3>Plan Details</h3>
    
        
        @if(isset($plan['item_name']))
          <label>Plan Name : </label> {{$product['item_name']}} <br>
        @endif
        @if(isset($plan['period']))
          <label>Plan Type : </label> {{$plan['period']}}<br>
        @endif
        @if(isset($plan['item_amount']))
          <label>Plan Amount : </label>{{$plan['item_currency']}} {{$plan['item_amount']}}<br>
        @endif

       @include('pages.checkout')
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



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

<h1>Add Plan</h1>

@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif




  <form action="{{url('plans/store')}}" method="POST">
    @csrf

    <div class="col-lg-6">

      <div class="form-group">
        <label>Plan Name</label> 
        <input name="name" class="form-control">
      </div>

      <div class="form-group">
          <label>Shopify Product ID</label> 
          <input name="product" type="number" class="form-control">
        </div>
  

      <div class="form-group">
          <label>Plan Description</label> 
          <input name="description" class="form-control">
      </div>

      <div class="form-group">
          <label>Plan Amount</label> 
          <input name="amount" type="number" class="form-control">
      </div>

    </div>

    <div class="col-lg-6">
      <div class="form-group">
          <label>Plan Currency</label> 
          @include('layouts.currencies')
      </div>

      <div class="form-group">
          <label>Plan Period</label> 
          <select name="period" class="form-control">
            <option>daily</option>
            <option>weekly</option>
            <option>monthly</option>
            <option>yearly</option>
          </select>
      </div>

      <div class="form-group">
          <label>Plan Interval</label> 
          <input name="interval" type="number" class="form-control">
      </div>

      <div class="form-group">
          <label>Plan Notes</label> 
          <input name="notes" type="text" class="form-control">
      </div>


      <input type="submit" value="Add Plan" class="btn btn-success float-right">

    </div>
  </form>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
<script>	

$(window).load(function() {
		// Animate loader off screen
		$(".se-pre-con").fadeOut("slow");;
	});

</script>
@endsection



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

<h1>Customers Registered</h1>

<ul class="list-group">
   
      
      @if(count($customers) > 0)
      
        @foreach ($customers as $key => $value)           
            <li>
            {{$value['email']}} {{$value['id']}}
            </li>
        @endforeach      
      @else
            <h3>No Customers Added</h3>
      @endif
</ul>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
<script>	

$(window).load(function() {
		// Animate loader off screen
		$(".se-pre-con").fadeOut("slow");;
	});

</script>

@endsection



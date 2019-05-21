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

@if(session('success'))
<div class="alert alert-success"> {{session('success')}}</div>
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

  <div class="col-lg-8">
        <h1>Update Eye Power</h1>
  <form action="{{url('eyepower/store')}}" method="POST">
        @csrf
        <div class="col-lg-6">

            <table>

                <tr>
                    <td></td>
                    <td>
                            <label> Select Right Eye Power </label>  
                    </td>
                    <td>
                            <label> Select Left Eye Power </label>    
                    </td>
                </tr>
                <tr>

                    <td>SPH </td>
                    <td>
                            <select name="right_power" class="form-control" >                                  
                                    <?php
                                        $i = -10;
                                        while($i  <= 4)
                                        {
                                            if($i == 0)
                                                echo "<option class='form-control' value='$i' selected>$i</option>";
                                            else
                                                echo "<option class='form-control' value='$i'>$i</option>";
                                            $i += 0.25;
                                        }
                                    
                                    ?>
                                </select>
                    </td>

                    <td>

                            <select name="left_power" class="form-control">            
                                    <?php
                                        $i = -10;
                                        while($i  <= 4)
                                        {
                                            if($i == 0)
                                                echo "<option class='form-control' value='$i' selected>$i</option>";
                                            else
                                                echo "<option class='form-control' value='$i'>$i</option>";
                                            $i += 0.25;
                                        }
                                    
                                    ?>
                            </select>

                    </td>

                </tr>           
                <tr>

                    <td></td>
                    <td></td>
                   
                    <td>     
                            <br><input type="submit" class="btn btn-success float-right" value="Save Power">
                    </td>
                </tr>

            </table>
              
           
        </div>
        
    </form>
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



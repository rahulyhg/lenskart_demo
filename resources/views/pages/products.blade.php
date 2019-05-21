@extends('layouts.app')

@section('content')

<h1>Products Registered</h1>

<div class="row">
   
@if(!empty($message))
    <div class="alert alert-danger">{{$message}}</div>
@endif
       
    <?php
    
    foreach ($products['products'] as $key => $value) {
        # code...
        echo "<div class='col-lg-4 card'>";   
        echo "<img class='img img-thumbnail' src='".$value['image']['src']."'>";
        echo "<b>".$value['title']. "</b>";
        echo "<br/> " . $value['product_type'];
        echo "<label class='text text-primary'>". $value['variants'][0]['price'] ."</label>";
        echo "<a class='btn btn-success' href='".url("products/".$value["id"])."' >View Details</a>";
        echo "</div>";
    }

    
    ?>

</div>

@endsection



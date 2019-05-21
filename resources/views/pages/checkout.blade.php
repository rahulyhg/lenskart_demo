<!--  The entire list of Checkout fields is available at
 https://docs.razorpay.com/docs/checkout-form#checkout-fields -->

 <button id="rzp-button1" class="btn btn-success">Pay with RazorPay</button>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
var options = {
    "key": "{{$key}}",
    "subscription_id": "{{$subscription['id']}}",
    //"amount": "{{$total}}", //no amount required as it will be automatically subtracted based on subscription amount
    "name": "LensKart",
    "description": "",
    "image": "",
    //"order_id": "order_9A33XWu170gUtm", not required
    "handler": function (response){ 
        var url = "{{url('payment/verify')}}/"+response.razorpay_payment_id+"/{{$subscription['id']}}/"+response.razorpay_signature;       
        window.location.replace(url);       
    },
    "prefill": {
        "name": "{{$customer['first_name']}}",
        "email": "{{$customer['email']}}"
    },
    "notes": {
        "address": "note value"
    },
    "theme": {
        "color": "#F37254"
    }
};
var rzp1 = new Razorpay(options);
document.getElementById('rzp-button1').onclick = function(e){
    rzp1.open();
    e.preventDefault();
}
</script>
  
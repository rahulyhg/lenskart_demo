<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::get('/customers','CustomersController@index');
Route::get('/customers/fetch','CustomersController@fetch_all');
Route::get('/customers/json','CustomersController@view_customers');
Route::get('/customers/create/{id}','CustomersController@store');


Route::get('/subscribe/shipping/{custid}/{prodid}/{planid}','SubscriptionController@shipping');
Route::get('/subscribe/{custid}/{prodid}/{planid}','SubscriptionController@subscribe');
Route::get('/subscription/webhook' , 'SubscriptionController@webhook');
Route::get('/subscription/cancel' , 'SubscriptionController@cancel');
Route::get('/subscription/renew' , 'SubscriptionController@renew');

Route::get('/products/store/{id}','ProductsController@store');

Route::get('/plans/create/','PlansController@create');
Route::post('/plans/store/','PlansController@store');
Route::get('/plans/product_plans/{product_id}','PlansController@product_plans');

Route::get('/eyepower/select','PowerController@create');
Route::post('/eyepower/store','PowerController@store');

Route::get('/prescriptions/upload','PrescriptionsController@create');
Route::get('/prescriptions/date','PrescriptionsController@displaydate');
Route::post('/prescriptions/store','PrescriptionsController@store');
Route::get('/prescriptions/sub','PrescriptionsController@getsub');
Route::get('/prescriptions/clear','PrescriptionsController@clearsession');
Route::get('/prescriptions/createsub','PrescriptionsController@createsub');



Route::get('/payment/checkout','PaymentsController@checkout');
Route::get('/payment/verify/{payment_ids}/{sub_id}/{signature}','PaymentsController@verify');
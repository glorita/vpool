<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

    $router->get('/', function () use ($router) {
        return "Voucher Pool by Gloris";

    //return $router->app->version();
    });

    $router->group(['prefix' => 'api'], function () use ($router) {
        
   // $router->get('vouchers',  ['uses' => 'VoucherController@index']);

    $router->get('vouchers/{id}', ['uses' => 'VoucherController@voucherFind']);
    
    $router->post('vouchers/{id_offer}/{date}', ['uses' => 'VoucherController@voucherGenerate']);
    
    $router->get('vouchers/{code}/{email}', ['uses' => 'VoucherController@voucherValidate']);

    
 //   $router->get('vouchers/{code}/{id_recip}', ['uses' => 'VoucherController@voucherValidate']);


    
});
    
    
    
    
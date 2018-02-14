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
/*************
 * @author: Gloris R. Vargas R.
 * @date: 02-12-2017
 * @description: Routes definition
 */
    $router->get('/', function () use ($router) {
        return "Voucher Pool by Gloris";

  
    });

    $router->group(['prefix' => 'api'], function () use ($router) {
    
    $router->get('vouchers/{id}', ['uses' => 'VoucherController@voucherFind']);
    
    $router->post('vouchers/{id_offer}/{date}', ['uses' => 'VoucherController@voucherGenerate']);
    
    $router->get('vouchers/{code}/{email}', ['uses' => 'VoucherController@voucherValidate']);

    $router->put('vouchers/{email}', ['uses' => 'VoucherController@voucherVouchersava']);
    
    
});
    
    
    
    
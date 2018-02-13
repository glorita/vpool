<?php

/*************
 * @author: Gloris R. Vargas R.
 * @date: 02-12-2017
 * @description: Vouchers operations
 */

namespace App\Http\Controllers;


use App\Voucher;
use App\Recipient;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\RecipientController;


class VoucherController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function index(){
  
        $Vouchers  = Voucher::all();
  
        return response()->json($Vouchers);
      
  
    }
    
    public function voucherValidate($code,$mail){
        
        $Voucher = $this->voucherByCode($code);
        //$Recipient = new Recipient;
        $rec = Recipient::recipientBymail($mail);
                
    
        
        return response()->json(['Validated'=>$rec]);
    }
    public function voucherFind($id){
  
        $Voucher  = Voucher::find($id);
  
        return response()->json($Voucher);
    }
    /*
     * Get the voucher by code
     */
    public function voucherByCode($code){
  
        $Voucher  = Voucher::where('code', '=', $code)->get();
  
        return response()->json($Voucher);
    }
    /*
     * Generate vouchers
     */
    public function voucherGenerate($id_offer,$expires){
        $Recipients  = Recipient::all();
        $count=0;
        foreach ($Recipients as $recip){
            $Voucher = new Voucher;
            $count++;
            $Voucher->code = str_random(8);
            $Voucher->expires = $expires;
            $Voucher->id_offer = $id_offer;
            $Voucher->id_recip = $recip->id;

            $Voucher->save();
        }
        
        return response()->json(['Generated Vouchers'=>$count]);
    }
}

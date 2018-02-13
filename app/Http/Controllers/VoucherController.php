<?php

namespace App\Http\Controllers;


use App\Voucher;
use App\Recipient;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


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
    public function voucherValidate($code,$email){
        
           
       
            $Receipt = DB::table('recipients')
                ->where('recipients.email', '=', $email)->get();
          /*       ->where('vouchers.code', '=', $code)
                ->where('vouchers.id_recip', '=', $Receipt->id) ->get();
  /*
        $Voucher = DB::table('vouchers')
        ->join('recipients', function ($join) {
            $join->on('vouchers.id_recip', '=', 'recipients.id')
                 ->where('recipients.email', '=', $email)
                 ->where('vouchers.code', '=', $code)
        })->get();
        */
       return response()->json(['Validated'=>$email]);
    }
    
    public function voucherFind($id){
  
        $Voucher  = Voucher::find($id);
  
        return response()->json($Voucher);
    }
    
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

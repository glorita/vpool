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
use Illuminate\Support\Carbon;

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

     /*
     * Get the voucher by ID
     */
    
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
    /*
     * Validate voucher given a code and an email
     */
    
        
    public function voucherValidate($code,$email){
        
        $varia = str_replace("%81", ".", $email);
       
        $reg = DB::select('SELECT vouchers.id,vouchers.code, vouchers.expires,offers.percent '
                . 'FROM vouchers JOIN recipients '
                . 'on recipients.id = vouchers.id_recip '
                . 'JOIN offers on offers.id = vouchers.id_offer'
                . ' WHERE vouchers.code =? AND recipients.email ="'.$varia.'"',[$code]);
   
        if ($reg){
            foreach($reg as $vouch){
                 
                 $voucher_u=$this->voucherUpdate($vouch->id);
                 return response()->json(['Percentage Discount'=>$vouch->percent]);
            }
            
           
        }
        else return response()->json(['This code and email combination is not valid']);
    }
     
    /*
     * Set the voucher date of usage
     */
    public function voucherUpdate($id){
              $now = Carbon::now();
              $voucher = Voucher::find($id);
              $voucher->used = TRUE;
              $voucher->used_on =$now->format('d.m.Y');
              $voucher->save();
              
        return response()->json($voucher);
     }
     /*
     * Shows the vouchers availables given an email
     */
     public function voucherVouchersava($email){
        
        $varia = str_replace("%81", ".", $email);
       
        $reg = DB::select('SELECT offers.name '
                . 'FROM vouchers JOIN recipients '
                . 'on recipients.id = vouchers.id_recip '
                . 'JOIN offers on offers.id = vouchers.id_offer'
                . ' WHERE recipients.email ="'.$varia.'"');
   
        if ($reg){
          
             return response()->json(['Available Vouchers:'=>$reg]);
        }
        else return response()->json(['This email has not  availables vouchers']);
    }
}

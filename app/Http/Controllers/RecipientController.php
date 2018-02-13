<?php

/*************
 * @author: Gloris R. Vargas R.
 * @date: 02-12-2017
 * @description: Recipients operations
 */

namespace App\Http\Controllers;


use App\Voucher;
use App\Recipient;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class RecipientController extends Controller
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
   /*
     * Get the recipient by email
     */
    public function recipientBymail($email){
  
        $Re  = Recipient::where('email', '=', $email)->get();
  
        return response()->json($Re);
    }
    
}
<?php
/*************
 * @author: Gloris R. Vargas R.
 * @date: 02-12-2017
 * @description: Vouchers Model
 */
namespace App;
  
use Illuminate\Database\Eloquent\Model;
  
class Voucher extends Model
{
     
     protected $fillable = ['code', 'expires', 'id_recip','id_offer'];
     
}
?>
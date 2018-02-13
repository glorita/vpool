<?php
namespace App;
  
use Illuminate\Database\Eloquent\Model;
  
class Voucher extends Model
{
     
     protected $fillable = ['code', 'expires', 'id_recip','id_offer'];
     
}
?>
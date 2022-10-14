<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RecurringPayment extends Model
{
    use HasFactory;
     /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'loanID',
        'payableamount',
        'paidamount',
        'paiddate',
        'duedate',
        'paymentstatus',
    ];
    public function getPaymentstatusAttribute($value) {
        if($value == 0){
            return "Need to be paid";
        }else if($value == 1){
            return "Paid";
        }else if($value == 2){
            return "Overdue";
        }
    }
   
    
}

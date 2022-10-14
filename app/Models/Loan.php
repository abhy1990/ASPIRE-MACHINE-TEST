<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Loan extends Model
{
    use HasFactory;
      /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'uid',
        'amount',
        'term',
        'status',
        'loanpaymentstatus',
        'approvedDate',
    ];

    public function getStatusAttribute($value) {
        if($value == 0){
            return "Pending";
        }else if($value == 1){
            return "Approved";
        }else if($value == 2){
            return "Rejected";
        }else if($value == 3){
            return "Completed";
        }
    }
    public function getloanpaymentstatusAttribute($value) {
        if($value == 0){
            return "Not Paid";
        }else if($value == 1){
            return "Partially Paid";
        }else if($value == 2){
            return "Fully Paid";
        }
    }

   
}

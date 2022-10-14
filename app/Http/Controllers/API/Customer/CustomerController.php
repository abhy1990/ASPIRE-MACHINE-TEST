<?php

namespace App\Http\Controllers\API\Customer;

use App\Http\Controllers\Controller;
use App\Models\Loan;
use App\Models\RecurringPayment;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
class CustomerController extends Controller
{
    //

    public function listLoans(Request $request)
    {
        if (Auth::guard('api')->check()) {
            $user = auth('api')->user();
            if ($user->userrole != "1") {
                return response()->json(['error' => 'You are not allowed to use this function'], 401);
            }
            $loans = Loan::select('id as loanID','amount as LoanAmount','term as Loanterm','status','approvedDate','created_at as LoanRequestedDate','loanpaymentstatus')->where('uid', $user->id)->paginate(10);

            return response()->json(['status' => true, 'message' => $loans], 200);

        } else {
            return response()->json(['error' => 'Unauthorised User'], 401);
        }
    }

    public function loanDetails(Request $request)
    {
        if (Auth::guard('api')->check()) {
            $user = auth('api')->user();
            if ($user->userrole != "1") {
                return response()->json(['error' => 'You are not allowed to use this function'], 401);
            }
            $rules = [
                'loanID' => 'required|numeric|gt:0', ////Loan amount
            ];

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json(['status' => false, 'message' => 'Loan ID is required'], 401);
            }
            $loandetails = RecurringPayment::select('id','loanID','payableamount','paidamount','paiddate','duedate','paymentstatus')->where('loanID', $request->loanID)->paginate(10);

            return response()->json(['status' => true, 'message' => $loandetails], 200);

        } else {
            return response()->json(['error' => 'Unauthorised User'], 401);
        }
    }
}

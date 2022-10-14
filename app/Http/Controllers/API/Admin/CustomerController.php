<?php

namespace App\Http\Controllers\API\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use App\Models\Loan;
use App\Models\RecurringPayment;
class CustomerController extends Controller
{
    //
    public function list(Request $request)
    {
        if (Auth::guard('api')->check()) {
            $user = auth('api')->user();
            if ($user->userrole == "1") {
                return response()->json(['error' => 'You are not allowed to use this function'], 401);
            }
            $user = User::where('userrole',1)->paginate(5);
            return response()->json(['status' => true, 'message' => $user], 200);
        }
    }

    public function listLoans(Request $request)
    {
        if (Auth::guard('api')->check()) {
            $user = auth('api')->user();
            if ($user->userrole == "1") {
                return response()->json(['error' => 'You are not allowed to use this function'], 401);
            }
            $rules = [
                'customerID' => 'required|numeric|gt:0', ////Loan amount
            ];

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json(['status' => false, 'message' => 'Customer ID is required'], 401);
            }
            $loans = Loan::select('id as loanID','amount as LoanAmount','term as Loanterm','status','approvedDate','created_at as LoanRequestedDate','loanpaymentstatus')->where('uid', $request->customerID)->paginate(10);

            return response()->json(['status' => true, 'message' => $loans], 200);

        } else {
            return response()->json(['error' => 'Unauthorised User'], 401);
        }
    }

    public function loanDetails(Request $request)
    {
        if (Auth::guard('api')->check()) {
            $user = auth('api')->user();
            if ($user->userrole == "1") {
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

<?php

namespace App\Http\Controllers\API\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Auth;
use App\Models\Loan;
use App\Models\RecurringPayment;
use Illuminate\Support\Facades\Validator;
class LoanController extends Controller
{
    //

    public function updateLoanStatus(Request $request)
    {

        if (Auth::guard('api')->check()) {
            $user = auth('api')->user();
            if ($user->userrole == "1") {
                return response()->json(['error' => 'You are not allowed to use this function'], 401);
            }
            $rules = [
                'loanID' => 'required|numeric|gt:0', ////Loan amount
                'status' => 'required|numeric|min:0|max:3', ///// Loan term Number of weeks
            ];

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json(['status' => false, 'message' => 'Please check the data you have entered'], 401);
            } else {
                Loan::where('id', $request->loanId)->update(array(
                    'status' => $request->status,
                ));
            }
            $status = "";
            if ($request->status == 0) {
                $status = "Pending";
            } elseif ($request->status == 1) {
                $status = "Approved";
            } elseif ($request->status == 2) {
                $status = "Rejected";
            } elseif ($request->status == 3) {
                $status = "Completed";
            }
            return response()->json(['status' => true, 'message' => "Loan Has been $status"], 200);
        }
    }
}

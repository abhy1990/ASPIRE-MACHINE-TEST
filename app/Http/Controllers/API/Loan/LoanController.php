<?php

namespace App\Http\Controllers\API\Loan;

use App\Http\Controllers\Controller;
use App\Models\Loan;
use App\Models\RecurringPayment;
use Auth;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class LoanController extends Controller
{
    //
    public function create(Request $request)
    {

        if (Auth::guard('api')->check()) {
            $user = auth('api')->user();
            if ($user->userrole != "1") {
                return response()->json(['error' => 'You are not allowed to use this function'], 401);
            }
            $rules = [
                'amount' => 'required|numeric|gt:0', ////Loan amount
                'term' => 'required|numeric|min:0|not_in:0', ///// Loan term Number of weeks
            ];

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json(['status' => false, 'message' => 'Please check the data you have entered'], 401);
            } else {
                DB::beginTransaction();
                try {
                    $loan = Loan::create([
                        'uid' => $user->id,
                        'amount' => $request->amount,
                        'term' => $request->term,
                        'status' => 0,
                        'loanpaymentstatus' => 0,
                    ]);
                    $recurringamt = $request->amount / $request->term;

                    $date = Carbon::now();
                    $date = $date->addDays(1);

                    for ($i = 1; $i <= $request->term; $i++) {

                        $date = $date->addDays(7);
                        $recurringPayment = RecurringPayment::create([
                            'loanID' => $loan->id,
                            'payableamount' => $recurringamt,
                            'duedate' => $date->format('Y-m-d'),
                            'paymentstatus' => 0,
                        ]);
                    }

                    DB::commit();
                } catch (\Exception $e) {
                    DB::rollBack();
                    return response()->json(['status' => false, 'message' => $e->getMessage()], 401);
                }
            }
            return response()->json(['status' => true, 'message' => 'Loan Created Successfully, Please wait for admin to approve'], 200);

        } else {
            return response()->json(['error' => 'Unauthorised User'], 401);
        }
    }

    public function payrecurringloan(Request $request)
    {
        if (Auth::guard('api')->check()) {
            $user = auth('api')->user();
            if ($user->userrole != "1") {
                return response()->json(['error' => 'You are not allowed to use this function'], 401);
            }
            $rules = [
                'loanId' => 'required|numeric|gt:0', /////user ID
                'amount' => 'required|numeric|gt:0', ////Loan amount
                'recurringID' => 'required|numeric|min:0|not_in:0', ///// Loan term Number of weeks
            ];

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json(['status' => false, 'message' => 'Please check the data you have entered'], 401);
            }
            $loandetails = Loan::where('id', $request->loanId)->first();
            $Recurringdetails = RecurringPayment::where('id', $request->recurringID)->first();
            if ($request->amount > $loandetails->amount) {
                return response()->json(['status' => false, 'message' => 'You cannot pay more amount than Loan amount'], 401);
            }
            if ($loandetails->status != "Approved") {
                return response()->json(['status' => false, 'message' => 'You cannot pay for a non approved loan'], 401);
            }
            if ($request->amount < $Recurringdetails->payableamount) {
                return response()->json(['status' => false, 'message' => 'You cannot pay less amount than due amount'], 401);
            }
            if ($Recurringdetails->paymentstatus == "1") {
                return response()->json(['status' => false, 'message' => 'You have already paid for this term'], 401);
            }

            if (strtotime(date('Y-m-d')) > strtotime($Recurringdetails->duedate)) {
                return response()->json(['status' => false, 'message' => 'You cannot For this term because you are overdue for this. Please contact admin'], 401);
            }

            RecurringPayment::where('id', $request->recurringID)->update(array(
                'paidamount' => $request->amount,
                'paiddate' => date('Y-m-d'),
                'paymentstatus' => 1,
            ));

            $totalPaidamount = RecurringPayment::where('loanID', $request->loanId)->where('paymentstatus', 1)->sum('paidamount');
            if ($totalPaidamount < $loandetails->amount) {
                
                Loan::where('id', $request->loanId)->update(array(
                    'loanpaymentstatus' => 2,
                    'status' => 1,
                ));
            }
            if ($totalPaidamount >= $loandetails->amount) {
                RecurringPayment::where('loanID', $request->loanId)->update(array(
                    'paymentstatus' => 1,
                ));
                Loan::where('id', $request->loanId)->update(array(
                    'loanpaymentstatus' => 2,
                    'status' => 3,
                ));
            }
            if ($request->amount == $loandetails->amount) {
                RecurringPayment::where('loanID', $request->loanId)->update(array(
                    'paymentstatus' => 1,
                ));
                Loan::where('id', $request->loanId)->update(array(
                    'loanpaymentstatus' => 1,
                    'status' => 3,
                ));
            }
            return response()->json(['status' => true, 'message' => 'payment done successully'], 200);
        } else {
            return response()->json(['error' => 'Unauthorised User'], 401);
        }
    }
}

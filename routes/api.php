<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\Loan\LoanController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('register',[AuthController::class,'register']);
Route::post('login',[AuthController::class,'login']);

Route::middleware('auth:api')->group(function(){
    Route::get('get-user',[AuthController::class,'userInfo']);
    
    
});
Route::post('loan/create','API\Loan\LoanController@create');
Route::post('loan/pay-recurring','API\Loan\LoanController@payrecurringloan');
Route::get('loan/list','API\Customer\CustomerController@listLoans');
Route::get('loan/details','API\Customer\CustomerController@loanDetails');
Route::get('admin/customer/list','API\Admin\CustomerController@list');
Route::post('admin/loan/changestatus','API\Admin\LoanController@updateLoanStatus');
Route::get('admin/loan/list','API\Admin\CustomerController@listLoans');
Route::get('admin/loan/details','API\Admin\CustomerController@loanDetails');
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

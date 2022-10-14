<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLoansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('loans', function (Blueprint $table) {
            $table->id();
            $table->integer('uid');
            $table->float('amount', 8, 5);
            $table->integer('term');
            $table->integer('status')->comment('0=>pending,1=>approved,2=>rejected');
            $table->integer('loanpaymentstatus')->comment('0=>not paid,1=>partially paid,2=>fully paid');
            $table->date('approvedDate');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('loans');
    }
}

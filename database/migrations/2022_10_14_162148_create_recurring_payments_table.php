<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecurringPaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('recurring_payments', function (Blueprint $table) {
            $table->id();
            $table->integer('loanID');
            $table->float('payableamount', 8, 5);
            $table->float('paidamount', 8, 5);
            $table->date('paiddate');
            $table->date('duedate');
            $table->integer('paymentstatus')->comment('0=>need to be paid,1=>paid,2=>overdue');
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
        Schema::dropIfExists('recurring_payments');
    }
}

<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->bigInteger('id')->primary();
            $table->string('email')->unique();
            $table->boolean('accepts_marketing')->default(0);
            $table->string('created_at');
            $table->string('updated_at');
            $table->string('first_name');
            $table->string('last_name');
            $table->integer('orders_count')->default(0);
            $table->string('state');
            $table->double('total_spent')->default(0);
            $table->bigInteger('last_order_id')->nullable();
            $table->string('note')->nullable();
            $table->boolean('verified_email');
            $table->string('multipass_identifier')->nullable();
            $table->boolean('tax_exempt');
            $table->bigInteger('phone')->nullable();
            $table->string('tags')->nullable();
            $table->string('last_order_name')->nullable();
            $table->char('currency', 5)->default('INR');
            $table->text('addresses')->nullable();
            $table->dateTime('accepts_marketing_updated_at')->nullable();
            $table->string('marketing_opt_in_level')->nullable();
            $table->string('admin_graphql_api_id')->nullable();
            $table->text('default_address')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customers');
    }
}

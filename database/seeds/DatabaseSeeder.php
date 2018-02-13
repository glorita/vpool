<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


use Faker\Factory as Faker;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->call('RecipientsTableSeeder');

        $this->command->info('Recipients table seeded!');
        
        $this->call('OffersTableSeeder');

        $this->command->info('Offers table seeded!');
       
       
    }
}




class RecipientsTableSeeder extends Seeder {

    public function run()
    {
 /*
          DB::table('recipients')->insert([
            'name' => str_random(10),
            'email' => str_random(10).'@gmail.com'
           
        ]);
          */
        $faker = Faker::create();
        foreach (range(1,10) as $index) {
	        DB::table('recipients')->insert([
	            'name' => $faker->name,
	            'email' => $faker->email
	            
	        ]);
        }
    }

}

class OffersTableSeeder extends Seeder {

    public function run()
    {
 
        $faker = Faker::create();
        foreach (range(1,10) as $index) {
	        DB::table('offers')->insert([
	            'name' => $faker->company,
	            'percent'=> $faker->randomDigit
	            
	        ]);
        }
    }

}
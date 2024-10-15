<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\Images;
use App\Models\Noticias;
use App\Models\Sponsors;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
        //Noticias::factory()->count(10)->create();
        //Images::factory()->count(5)->create();
        //Sponsors::factory()->count(4)->create();

        $this->call(UserSeeder::class);
        $this->call(LinkSeeder::class);
        //$this->call(ImageSeeder::class);
    }
}

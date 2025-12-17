<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
Use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //creación de usuarios para roles de prueba
        User::create([
            'name'=>'Admin',
            'email'=>'admin@mail.com',
            'password'=> Hash::make('admin'),
            'email_verified_at'=> '2023-11-17 18:07:39',
        ]);
    }
}

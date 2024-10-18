<?php

namespace Database\Seeders;

use App\Models\Links;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class LinkSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        Links::create([
            'name'=>'Wuaze TV - En vivo',
            'link'=>'https://www.youtube.com/embed/jfKfPfyJRdk?autoplay=1&mute=1&modestbranding=1',
        ]);
    }
}

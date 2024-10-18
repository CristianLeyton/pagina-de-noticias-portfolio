<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Images;


class ImageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        Images::create([
            'name' => 'Banner - Wuaze TV',
            'image' => config('app.url').'src/images/wuaze-banner.webp'
        ]);
    }
}

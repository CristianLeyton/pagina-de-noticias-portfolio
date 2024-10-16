<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Anuncios extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'banner', 'link', 'created_at', 'updated_at'];
}

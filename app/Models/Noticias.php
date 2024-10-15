<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Noticias extends Model
{
    protected $fillable = ['title', 'slug', 'content', 'published_at', 'short_description','image', 'created_at', 'updated_at']; // Agrega aquí todos los campos que quieras permitir
    use HasFactory;
}

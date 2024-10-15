<?php

namespace App\Http\Controllers;

use App\Models\Images;
use Illuminate\Http\Request;

class ImagesController extends Controller
{
    //
    public function getAll()
    {
        // Obtener todos los registros
        $response = Images::all();

        // Devolver respuesta JSON
        return response()->json($response);
    }
}

<?php

namespace App\Http\Controllers;

use App\Models\Links;
use Illuminate\Http\Request;

class LinksController extends Controller
{
    //
    public function getAll()
    {
        // Obtener todos los registros
        $response = Links::all()->last();

        // Devolver respuesta JSON
        return response()->json($response);
    }
}

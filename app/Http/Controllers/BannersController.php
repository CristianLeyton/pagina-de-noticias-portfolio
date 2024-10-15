<?php

namespace App\Http\Controllers;

use App\Models\Anuncios;
use Illuminate\Http\Request;

class BannersController extends Controller
{
    //
    public function getAll()
    {
        // Obtener todos los registros
        $response = Anuncios::all();

        // Devolver respuesta JSON
        return response()->json($response);
    }
}

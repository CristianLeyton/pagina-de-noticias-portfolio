<?php

namespace App\Http\Controllers;

use App\Models\Sponsors;
use Illuminate\Http\Request;

class SponsorsController extends Controller
{
    //
    public function getAll()
    {
        // Obtener todos los registros
        $response = Sponsors::all();

        // Devolver respuesta JSON
        return response()->json($response);
    }
}

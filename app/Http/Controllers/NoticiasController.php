<?php

namespace App\Http\Controllers;

use App\Models\Noticias;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class NoticiasController extends Controller
{

    public function getAll()
    {
        //Obtengo todas las noticias
        $consulta = Noticias::all();

        // Formatear la fecha para cada noticia
        $noticias = $consulta->map(function ($noticia) {
            $noticia->published_at = $this->formatearFecha($noticia->published_at);
            return $noticia;
        });

        // Devolver respuesta JSON
        return response()->json($noticias);
    }

    public function getPaginatedNoticias(Request $request)
    {
        // Definir cuántas noticias cargar por página
        $limit = 4;
        // Obtener el número de la página desde el request, por defecto es 1
        $page = $request->input('page', 1);
        // Calcular el offset (cuántas noticias saltar)
        $offset = ($page - 1) * $limit + 4;

        $search = $request->get('search');

        // Obtener las noticias paginadas, excepto las primeras 4 
        $consulta = Noticias::whereAny([
            'title',
            'content',
            'short_description'
        ], 'like', "%$search%")->orderBy('published_at', 'desc')
            ->skip($offset)// Salta las noticias ya cargadas
            ->take($limit)// Obtiene solo el número de noticias definido por $limit
            ->get();

        // Formatear la fecha para cada noticia
        $noticias = $consulta->map(function ($noticia) {
            $noticia->published_at = $this->formatearFecha($noticia->published_at);
            return $noticia;
        });

        // Devolver respuesta JSON con las noticias y el número de página
        return response()->json([
            'noticias' => $noticias,
            'page' => $page,
            'hasMore' => $consulta->count() == $limit  // Si hay más noticias por cargar
        ]);
    }


    public function getNoticiasPage(Request $request)
    {
        // Obtener todos los registros
        //$noticias = Noticias::all();

        $search = $request->get('search');

        //Obtengo los últimos 4
        $consulta = Noticias::whereAny([
            'title',
            'content',
            'short_description'
        ], 'like', "%$search%")->orderBy('published_at', 'desc')->take(4)->get();

        // Formatear la fecha para cada noticia
        $noticias = $consulta->map(function ($noticia) {
            $noticia->published_at = $this->formatearFecha($noticia->published_at);
            return $noticia;
        });

        return view('noticias', compact('noticias'));
        // Devolver respuesta JSON
        //return response()->json($response);
    }

    public function getLasts()
    {
        // Obtener todos los registros
        //$noticias = Noticias::all();

        //Obtengo los últimos 4
        $noticias = Noticias::orderBy('published_at', 'desc')->take(4)->get();

        // Formatear la fecha para cada noticia
        $response = $noticias->map(function ($noticia) {
            $noticia->published_at = $this->formatearFecha($noticia->published_at);
            return $noticia;
        });

        // Devolver respuesta JSON
        return response()->json($response);
    }

    public function formatearFecha($fecha)
    {
        // Crear el formato de fecha usando IntlDateFormatter
        $formatter = new \IntlDateFormatter(
            'es_ES', // Idioma y localización
            \IntlDateFormatter::FULL, // Formato largo para la fecha completa
            \IntlDateFormatter::NONE // Sin formato de hora
        );

        // Formatear la fecha
        $date = \DateTime::createFromFormat('Y-m-d', $fecha);

        return $formatter->format($date);
    }

    public function getNotice($slug)
    {
        // Buscar la noticia que coincida con el slug
        $noticia = Noticias::where('slug', $slug)->first();

        // Verificar si la noticia existe
        if (!$noticia) {
            return redirect('/');
        }

        $noticia->published_at = $this->formatearFecha($noticia->published_at);
        $noticia->content = Str::markdown($noticia->content);

        // Decodificar entidades HTML, basicamente convierte todo a html
        $noticia->content = html_entity_decode($noticia->content);

        return view('noticia', compact('noticia'));

        // Devolver la noticia como respuesta JSON
        //return response()->json($noticia);
    }
}

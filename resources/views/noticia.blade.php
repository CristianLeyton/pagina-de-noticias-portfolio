@extends('layouts.app')

@section('content')
{{--          <span class="text-white">
        {{$noticia}}
    </span>  --}}

    <section class="bg-slate-50 px-5 py-5 md:px-10 max-w-6xl mx-auto">
        <share-component :noticia-title="'{{ $noticia->title }}'"></share-component>

        <hr class="my-4">
        <header class="{{-- flex --}}">
{{--             <div class="max-w-[75%]"> --}}
            <h1 class="font-bold text-4xl lg:text-5xl text-pretty">{{ $noticia->title }}</h1>
            <p class="pl-1 pt-4 text-sm text-gray-600">{{ $noticia->published_at }}</p>
{{--             </div> --}}
            {{-- <img class="w-[25%] aspect-video" src="{{ url('storage', [$noticia->image]) }}" alt="{{ $noticia->title }}"> --}}
        </header>
        <hr class="my-4">

        {{-- Mostrar el contenido convertido a HTML --}}
        <div class="markdown-content no-tailwind text-pretty">
            {!! $noticia->content !!}
        </div>

        <hr class="my-4">
        <share-component :noticia-title="'{{ $noticia->title }}'"></share-component>
    </section>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Seleccionar todos los enlaces en el contenido de markdown
            document.querySelectorAll('.markdown-content a').forEach(function(link) {
                link.setAttribute('target', '_blank');  // Establece el atributo target para abrir en una nueva pestaña
                link.setAttribute('rel', 'noopener noreferrer'); // Seguridad adicional
            });
        });
    </script>
@endsection

@extends('layouts.app')

@section('content')
    {{--                  <span class="text-white">
        {{ $noticias}}
    </span>   --}}

    <section class="bg-slate-50 px-5 py-5 max-w-6xl mx-auto">

        <section class="flex flex-col gap-5 items-center w-full mx-auto overflow-hidden mb-5">
            <h1 class="text-xl sm:text-2xl md:text-3xl lg:text-4xl font-bold text-red-600 p-1">NOTICIAS - CANAL 3</h1>



            @if (isset($noticias[0]))
                @foreach ($noticias as $noticia)
                    <article class="flex flex-col md:flex-row p-3 w-full gap-5" title="{{ $noticia->title }}">

                        <a href="{{ url('noticias', [$noticia->slug]) }}"
                            class="shadow-image w-full aspect-video md:max-w-sm lg:max-w-lg overflow-hidden"
                            title="{{ $noticia->title }}">
                            <span
                                class="block w-full h-full bg-cover bg-center bg-no-repeat hover:scale-110 transform transition-all duration-500 ease-in-out overflow-hidden"
                                style="background-image: url('{{ url('storage_public', [$noticia->image]) }}')"
                                title="{{ $noticia->title }}">
                            </span>

                        </a>
                        <div class="inline-flex flex-col gap-4 overflow-hidden md:w-[50%] justify-between">
                            <div class="flex flex-col gap-1 md:gap-2">
                                <h3 class="text-xl md:text-2xl lg:text-3xl font-bold md:line-clamp-2 text-ellipsis"><a
                                        href="{{ url('noticias', [$noticia->slug]) }}" title="{{ $noticia->title }}">
                                        {{ $noticia->title }}</a>
                                </h3>
                                <small class="first-letter:capitalize text-gray-500">{{ $noticia->published_at }}</small>
                                <p class="text-ellipsis text-pretty text-sm line-clamp-4 lg:line-clamp-5 font-semibold">
                                    {{ $noticia->short_description }} </p>
                            </div>
                            <a href="{{ url('noticias', [$noticia->slug]) }}" class="text-center w-full grid">
                                <button
                                    class="text-white bg-red-600 hover:bg-red-500 active:scale-95 pb-1 rounded-2xl text-lg font-semibold my-2 transition-all duration-100 ease-out">
                                    Leer más
                                </button>
                            </a>
                        </div>
                    </article>
                @endforeach
            @else
                <h2 class="text-lg sm:text-xl md:text-2xl lg:text-3xl font-semibold text-red-600 p-1">Oops! No se encontró
                    ninguna noticia</h2>
            @endif

        </section>

        <noticias-page-component></noticias-page-component>
    </section>

    <script></script>
@endsection

<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="scroll-smooth">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Canal 3 - Salta</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    @vite(['resources/js/app.js', 'resources/css/app.css'])

    <style>
        /* Reset básico para elementos comunes */
        .no-tailwind h1,
        .no-tailwind h2,
        .no-tailwind h3,
        .no-tailwind h4,
        .no-tailwind p,
        .no-tailwind ul,
        .no-tailwind ol,
        .no-tailwind li,
        .no-tailwind th,
        .no-tailwind td,
        .no-tailwind tr {
            all: revert;
            /* Reinicia todos los estilos a los estilos por defecto del navegador */
            margin: revert;
            padding: revert;
            font-size: revert;
            font-family: revert;
            color: revert;
            border: revert;
            text-wrap: pretty;
        }

        /* Puedes también manejar imágenes, tablas, etc., si lo necesitas */
        .no-tailwind p:has(img) {
            all: revert;
            margin: 0 auto;
            max-width: 768px;
        }

        .no-tailwind a {
            all: revert;
        }

        .no-tailwind blockquote {
            all: revert;
            display: flex;
            gap: 1px;
            background: #eee;
            padding: 1px 20px;
            color: #333333;
            width: fit-content;
            position: relative;
            border-radius: 6px;
            font-weight: 500;

            &::before,
            &::after {
                content: '"';
                position: relative;
                top: 10px;
                font-size: 20px;
            }
        }

        .no-tailwind table {
            all: revert;
            border-collapse: collapse;

            & th,
            td,
            tr {
                padding: 1px 10px;
                border: 1px solid #ccc;
            }

        }

        .no-tailwind iframe {
            width: 100% !important;
            margin: 0 auto;
            max-width: 768px;
            height: auto;
            aspect-ratio: 16/9;
        }


        .shadow-image {
            box-shadow: -2px 2px 10px #808080;
        }
    </style>

</head>

<body class="antialiased ">
    <div id="app"
        class="bg-gray-100 dark:bg-gray-900 top-0 z-[-2] min-h-[100dvh] w-full  bg-[radial-gradient(#eeeeee33_1px,#1d1d1d_1px)] bg-[size:20px_20px]">
        <header-component></header-component>
        <main class="container mx-auto px-2">
            @yield('content')
        </main>
        <footer-component></footer-component>
    </div>

</body>

</html>

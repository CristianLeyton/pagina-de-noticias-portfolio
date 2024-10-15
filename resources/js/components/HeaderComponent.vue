<template>
    <header class="bg-red-600 text-white sticky top-0 z-50" :class="{'shadow-red': !mostrarSearch}">
        <nav class="container mx-auto flex justify-between items-center px-4 z-10 bg-red-600">
            <a href="/" title="Canal 3 - Salta">
                <LogoComponent />
            </a>

            <nav class="hidden md:flex items-center nowrap gap-8">
                <ul class="uppercase flex gap-6 font-semibold">
                    <li class="border-b-2 border-transparent hover-border-b relative"><a href="/#inicio"
                            title="Inicio">Inicio</a></li>
                    <li class="border-b-2 border-transparent hover-border-b relative"><a href="/noticias"
                            title="Noticias">Noticias</a></li>
                    <li class="border-b-2 border-transparent hover-border-b relative"><a href="#contacto"
                            title="Contacto">Contacto</a></li>
                </ul>

                <form action="/noticias" method="get">
                    <div class="relative w-full">
                        <input class="rounded-3xl outline-none text-gray-900 py-2 px-4 w-80 text-sm" name="search"
                            placeholder="" required>
                        <button title="Buscar" type="submit"
                            class="absolute top-0 end-0 h-full px-3 text-sm font-medium text-red-600">
                            <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                                viewBox="0 0 20 20">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                    stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                            </svg>
                            <span class="sr-only">Search</span>
                        </button>
                    </div>
                </form>
            </nav>

            <nav class="flex md:hidden items-center nowrap gap-8">
                <button @click="toggleSearch" title="Mostrar buscador">
                    <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                        viewBox="0 0 20 20">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"
                            d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                    </svg>
                </button>

                <button @click="toggleMenu" title="Mostrar menú"><svg xmlns="http://www.w3.org/2000/svg" width="24"
                        height="24" viewBox="0 0 24 24" style="fill: currentColor;">
                        <path d="M4 6h16v2H4zm0 5h16v2H4zm0 5h16v2H4z"></path>
                    </svg>
                </button>
            </nav>
        </nav>

        <!-- Formulario de búsqueda -->
        <transition name="slide">
            <form v-show="mostrarSearch" id="form-search" action="/noticias" method="get"
                class="absolute top-full w-full bg-red-600 py-2 px-4 sm:px-16 -z-10 md:hidden" :class="{'border-b-2 border-red-700': mostrarSearch}">
                <div class="w-full relative">
                    <input class="w-full rounded-3xl outline-none text-gray-900 py-2 px-4 text-sm" name="search"
                        placeholder="" required>
                    <button title="Buscar" type="submit"
                        class="absolute top-0 end-0 h-full px-3 text-sm font-medium text-red-600">
                        <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                            viewBox="0 0 20 20">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                        </svg>
                        <span class="sr-only">Search</span>
                    </button>
                </div>
            </form>
        </transition>

        <!-- Menu mobile -->
        <transition name="slide">
            <div v-show="mostrarMenu" class="bg-red-600 absolute top-full w-full -z-20 md:hidden" :class="{'border-b-2 border-red-700': mostrarMenu}">
                <ul class="uppercase flex flex-col gap-2 font-semibold px-14 py-4">
                    <a href="/#inicio" title="Inicio">
                        <li class="border-b-2 border-transparent rounded-lg px-4 py-1 hover:bg-red-500">Inicio</li>
                    </a>
                    <a href="/noticias" title="Noticias">
                        <li class="border-b-2 border-transparent rounded-lg px-4 py-1 hover:bg-red-500">Noticias</li>
                    </a>
                    <a href="#contacto" title="Contacto">
                        <li class="border-b-2 border-transparent rounded-lg px-4 py-1 hover:bg-red-500">Contacto</li>
                    </a>
                </ul>
            </div>
        </transition>
    </header>

</template>

<script setup>
import { ref } from 'vue';
import LogoComponent from './images/LogoComponent.vue';

const mostrarSearch = ref(false);
const mostrarMenu = ref(false);


// Función para alternar la visibilidad del Menu
const toggleMenu = () => {
    mostrarMenu.value = !mostrarMenu.value;
    mostrarSearch.value = false;
};

// Función para alternar la visibilidad del formulario
const toggleSearch = () => {
    mostrarSearch.value = !mostrarSearch.value;
    mostrarMenu.value = false;
};
</script>

<style scoped>
/* Transiciones de slide para el menú móvil */
.slide-enter-active,
.slide-leave-active {
    transition: transform 0.5s ease;
}

.slide-enter-from {
    transform: translateY(-100%);
}

.slide-leave-to {
    transform: translateY(-100%);
}

.shadow-red {
    box-shadow: 0 2px 0px #B91C1C;
}

.hover-border-b::after {
    content: "";
    display: block;
    width: 0;
    height: 2px;
    background-color: #fff;
    position: absolute;
    bottom: -2px;
    left: 50%;
    transform: translateX(-50%);
    transition: width 0.3s ease-in-out;
}

.hover-border-b:hover::after {
    width: 100%;
}
</style>
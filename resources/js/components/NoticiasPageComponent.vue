<template>
    <transition name="slide">
        <section v-if="ultimasNoticias.length"
            class="flex flex-col gap-5 items-center w-full mx-auto overflow-hidden mb-10">

            <article v-for="(noticia, index) in noticiasMostradas" :key="index"
                class="flex flex-col md:flex-row p-3 w-full gap-5 animate-load" :title="noticia.title">

                <a :href="noticia.link" 
                    class="shadow-image w-full aspect-video md:max-w-sm lg:max-w-lg overflow-hidden"
                    :title="noticia.title">
                    <span
                        class="block w-full h-full bg-cover bg-center bg-no-repeat hover:scale-110 transform transition-all duration-500 ease-in-out overflow-hidden"
                        :style="{ backgroundImage: `url(${noticia.urlImage})` }" :title="noticia.title">
                    </span>
                </a>
                
                <div class="inline-flex flex-col gap-4 overflow-hidden md:w-[50%] justify-between">
                    <div class="flex flex-col gap-1 md:gap-2">
                        <h3 class="text-xl md:text-2xl lg:text-3xl font-bold md:line-clamp-2 text-ellipsis">
                            <a :href="noticia.link" :title="noticia.title"> {{ noticia.title }}</a>
                        </h3>
                        <small class="first-letter:capitalize text-gray-500">{{ noticia.date }}</small>
                        <p class="text-ellipsis text-pretty text-sm line-clamp-4 lg:line-clamp-5 font-semibold">
                            {{ noticia.description }} 
                        </p>
                    </div>
                    <a :href="noticia.link" class="text-center w-full grid">
                        <button
                            class="text-white bg-red-600 hover:bg-red-500 active:scale-95 pb-1 rounded-2xl text-lg font-semibold my-2 transition-all duration-100 ease-out">
                            Leer más
                        </button>
                    </a>
                </div>
            </article>

            <!-- Botón de cargar más noticias, ocultar cuando todas las noticias hayan sido cargadas -->
            <button v-if="puedeCargarMas" @click="cargarMasNoticias"
                    class="text-white w-full bg-red-600 hover:bg-red-500 active:scale-95 pb-1 rounded-2xl text-xl font-semibold my-2 transition-all duration-100 ease-out">
                    Cargar más noticias
            </button>
        </section>
    </transition>
</template>

<script setup>
import { ref } from 'vue';

// Noticias cargadas
const ultimasNoticias = ref([]);

// Noticias que se muestran
const noticiasMostradas = ref([]);

// Lógica para determinar si aún se pueden cargar más noticias
const puedeCargarMas = ref(true);

// Variables para el manejo de la paginación
let currentPage = 1;
const limit = 4;  // Cantidad de noticias por página
const urlBase = window.location.origin;
let urlApi = `${urlBase}/api/noticias/paginated?page=${currentPage}`;

// Obtener la URL de la ventana actual
const currentUrl = window.location.href;

// Crear un objeto URL a partir de la URL actual
const url = new URL(currentUrl);

// Obtener los parámetros de búsqueda
const urlParams = new URLSearchParams(url.search);

// Comprobar si existe el parámetro 'search'
if (urlParams.has('search')) {
    let searchValue = urlParams.get('search');
    searchValue = searchValue.replaceAll(' ', '+');
    urlApi = `${urlApi}&search=${searchValue}`;
    console.log(`La URL a usar: ${urlApi}`);
} else {
    console.log(`La URL a usar: ${urlApi}`);
}

// Función para cargar noticias desde la API
const cargarNoticias = () => {
    fetch(urlApi)
        .then(response => response.json())
        .then((data) => {
            // Añadir las nuevas noticias a la lista
            data.noticias.forEach(item => {
                const urlImage = `${urlBase}/storage_public/${item.image}`;
                const urlNoticia = `${urlBase}/noticias/${item.slug}`;
    
                const noticia = {
                    urlImage: urlImage,
                    title: item.title,
                    description: item.short_description,
                    date: item.published_at,
                    link: urlNoticia
                };
                ultimasNoticias.value.push(noticia);
            });

            // Actualizar las noticias que se mostrarán en la página
            noticiasMostradas.value = ultimasNoticias.value.slice(0, limit * currentPage);

            // Ocultar el botón si no hay más noticias
            if (!data.hasMore) {
                puedeCargarMas.value = false;
            }
        })
        .catch(err => console.error(err));
};

// Función para cargar más noticias al hacer clic en el botón
function cargarMasNoticias() {
    currentPage++;

    fetch(`${urlBase}/api/noticias/paginated?page=${currentPage}`)
        .then(response => response.json())
        .then(data => {
            // Añadir las nuevas noticias a la lista
            data.noticias.forEach(item => {
                const urlImage = `${urlBase}/storage_public/${item.image}`;
                const urlNoticia = `${urlBase}/noticias/${item.slug}`;
    
                const noticia = {
                    urlImage: urlImage,
                    title: item.title,
                    description: item.short_description,
                    date: item.published_at,
                    link: urlNoticia
                };
                ultimasNoticias.value.push(noticia);
            });

            // Actualizar las noticias que se mostrarán en la página
            noticiasMostradas.value = ultimasNoticias.value.slice(0, limit * currentPage);

            // Ocultar el botón si no hay más noticias
            if (!data.hasMore) {
                puedeCargarMas.value = false;
            }
        })
        .catch(err => console.error(err));
}

// Cargar las noticias iniciales al montar el componente
cargarNoticias();
</script>

<style scoped>
.slide-enter-active,
.slide-leave-active {
    transition: transform 0.8s ease;
}

.slide-enter-from {
    transform: translateY(100%);
}

.slide-leave-to {
    transform: translateY(100%);
}

.shadow-image {
    box-shadow: -2px 2px 10px #808080;
}

.animate-load {
    animation: opacity-load 0.7s both;
}

@keyframes opacity-load {
    from {
        opacity: 0;
    }

    to {
        opacity: 1;
    }
}
</style>

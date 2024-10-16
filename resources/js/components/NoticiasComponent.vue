<template>
    <div id="noticias" class="scroll-m-24">
    </div>
    <transition name="slide">
        <section v-if="ultimasNoticias != 0"
            class="flex flex-col gap-5 items-center w-full mx-auto max-w-4xl overflow-hidden mb-10 bg-slate-100 rounded-3xl p-3">
            <h1 class="text-xl sm:text-2xl md:text-3xl lg:text-4xl font-bold text-red-600 pt-3">ÚLTIMAS NOTICIAS</h1>

            <article v-for="(noticia, index) in ultimasNoticias" :key="index"
                class="flex flex-col md:flex-row rounded-xl p-3 w-full gap-5" :title="noticia.title">

                <a :href="noticia.link" class="shadow-image w-full aspect-video md:max-w-sm lg:max-w-md overflow-hidden"
                    :title="noticia.title">
                    <span
                        class="block w-full h-full bg-cover bg-center bg-no-repeat hover:scale-110 transform transition-all duration-500 ease-in-out overflow-hidden"
                        :style="{ backgroundImage: `url(${noticia.urlImage})` }" :title="noticia.title">
                    </span>

                </a>
                <div class="inline-flex flex-col gap-4 overflow-hidden md:w-[50%] justify-between">
                    <div class="flex flex-col gap-1 md:gap-2">
                        <h3 class="text-xl md:text-2xl lg:text-3xl font-bold md:line-clamp-2 text-ellipsis"><a
                                :href="noticia.link" :title="noticia.title"> {{ noticia.title }}</a></h3>
                        <small class="first-letter:capitalize text-gray-500">{{ noticia.date }}</small>
                        <p class="text-ellipsis text-pretty text-sm line-clamp-4 lg:line-clamp-5 font-semibold">
                            {{ noticia.description }} </p>
                    </div>
                    <a :href="noticia.link" class="text-center w-full grid">
                        <button
                            class="text-white bg-red-600 hover:bg-red-500 active:scale-95 pb-1 rounded-2xl text-lg font-semibold my-2 transition-all duration-100 ease-out">
                            Leer más
                        </button>
                    </a>
                </div>
            </article>

            <a href="/noticias" class="w-full" title="Ver más noticias"> <button
                    class="text-white w-full bg-red-600 hover:bg-red-500 active:scale-95 pb-1 rounded-2xl text-xl font-semibold my-2 transition-all duration-100 ease-out">
                    Ver más noticias
                </button></a>
        </section>
    </transition>
</template>

<script setup>

import { ref } from 'vue';

const ultimasNoticias = ref([]);

const urlBase = window.location.origin;
const urlApi = `${urlBase}/api/noticias`;

/*Consumo la API*/
fetch(urlApi)
    .then(response => response.json())
    .then((data) => {
        data.forEach(item => {
            const urlImage = `${urlBase}/storage_public/${item.image}`;
            const urlNoticia = `${urlBase}/noticias/${item.slug}`;

            const noticia = {
                urlImage: urlImage,
                title: item.title,
                description: item.short_description,
                date: item.published_at,
                link: urlNoticia
            }
            ultimasNoticias.value.push(noticia);
        });
    })
    .catch(err => console.error(err));


//console.log(ultimasNoticias.value)

/*Hasta aquí el consumo de la API*/
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
    box-shadow: -1px 1px 8px #808080;
}
</style>

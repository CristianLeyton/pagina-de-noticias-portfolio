<template>
    <div class="h-fit pt-8 mb-8 scroll-m-16" id="inicio">
        <span
            class="text-white text-base sm:text-lg md:text-xl lg:text-2xl font-semibold block text-center bg-red-600 w-full max-w-4xl mx-auto rounded-t-3xl uppercase p-2">TRANSMISIÓN
            EN VIVO</span>
        <div v-if="!linkLive"
            class="text-white bg-slate-950 w-full max-w-4xl aspect-video mx-auto grid place-items-center">
            <i class='bx bx-loader-alt bx-spin text-5xl'></i>
        </div>
        <iframe v-else class="w-full max-w-4xl aspect-video mx-auto bg-slate-950" :src="linkLive" :title="nameLive" 
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen>
        </iframe>
    </div>
</template>

<script setup>

import { ref } from 'vue';

let linkLive = ref('');
let nameLive = ref('')

const urlBase = window.location.origin;
const urlApi = `${urlBase}/api/links`;

fetch(urlApi)
    .then(res => res.json())
    .then((data) => {linkLive.value = data.link, nameLive = data.name})
    .catch(err => console.error(err));


</script>

<style scoped></style>

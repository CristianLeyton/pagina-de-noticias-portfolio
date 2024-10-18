<template>
    <div class="h-fit pt-8 mb-8 scroll-m-16 container mx-auto px-2" id="inicio">
        <span
            class="text-red-500 font-bold text-lg md:text-xl lg:text-2xl block text-center w-full max-w-4xl mx-auto rounded-t-3xl uppercase pt-0 pb-6">TRANSMISIÓN
            EN VIVO</span>
        <div v-if="!linkLive"
            class="shadow-big text-white bg-slate-950 w-full max-w-4xl aspect-video mx-auto grid place-items-center">
            <i class='bx bx-loader-alt bx-spin text-5xl'></i>
        </div>
        <iframe v-else class="shadow-big w-full max-w-4xl aspect-video mx-auto bg-slate-950" :src="linkLive" :title="nameLive" 
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

<style>

.shadow-big {
    box-shadow: 0px 5px 40px rgba(62, 62, 62, 0.15)!important;
}

</style>

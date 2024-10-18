<template>
  <transition name="slide">
    <div v-if="urlAnuncios != 0" class="flex flex-col gap-10 items-center pb-8 bg-red-600 ">
      <div class="max-w-5xl ">
        <a v-for="(banner, index) in urlAnuncios" :key="index" :href="banner.link" target="_blank">
          <img class="container mx-auto px-2 xl:px-0" :src="banner.url" :alt="banner.name" :title="banner.name">
        </a>
      </div>
    </div>
  </transition>
</template>

<script setup>

import { ref, onMounted } from 'vue';

const urlBase = window.location.origin;
const urlApi = `${urlBase}/api/anuncios`;

let urlAnuncios = ref([]);


/*Consumo la API*/
fetch(urlApi)
  .then(response => response.json())
  .then((data) => {
    data.forEach(item => {
      const urlImage = `${urlBase}/storage_public/${item.banner}`;

      const banner = {
        url: urlImage,
        name: item.name,
        link: item.link
      }

      urlAnuncios.value.push(banner);
    });
  })
  .catch(err => console.error(err));


//console.log(urlAnuncios.value)

/*Hasta aquí el consumo de la API*/



</script>

<style scoped>
.slide-enter-active,
.slide-leave-active {
  transition: transform 0.4s ease;
}

.slide-enter-from {
  transform: translateY(500%);
}

.slide-leave-to {
  transform: translateY(500%);
}
</style>

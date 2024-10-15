<template>
    <transition name="slide">
      <div v-if="urlSponsors.length" class="max-w-5xl slider">
        <div class="slide-track">
          <!-- Duplicar los elementos para un scroll infinito -->
          <a target="_blank" v-for="(banner, index) in [...urlSponsors, ...urlSponsors]" :href="banner.link" :key="index"
            class="slide block w-full bg-center bg-cover bg-no-repeat max-w-72 md:max-w-[310px] aspect-video"
            :style="{ backgroundImage: `url(${banner.url})` }" :alt="banner.name" :title="banner.name">
          </a>
        </div>
      </div>
    </transition>
  </template>

<script setup>

import { ref } from 'vue';

const urlBase = window.location.origin;
const urlApi = `${urlBase}/api/sponsors`;

let urlSponsors = ref([]);


/*Consumo la API*/
fetch(urlApi)
    .then(response => response.json())
    .then((data) => {
        data.forEach(item => {
            const urlImage = `${urlBase}/storage/${item.image}`;

            const sponsor = {
                url: urlImage,
                name: item.name,
                link: item.link
            }

            urlSponsors.value.push(sponsor);
        });
    })
    .catch(err => console.error(err));


console.log(urlSponsors.value)

/*Hasta aquí el consumo de la API*/

</script>

<style scoped>
.slide-enter-active,
.slide-leave-active {
    transition: transform 0.4s ease;
}

.slide-enter-from {
    transform: translateY(500%);
    opacity: 100;
}

.slide-leave-to {
    transform: translateY(500%);
    opacity: 100;
}


.slider {
  display: flex;
  width: 90vw;
  height: auto;
  margin: auto;
  overflow: hidden;
}

.slider .slide-track {
  display: flex;
  animation: scroll 30s linear infinite;
  animation-play-state: running; /* Inicialmente, la animación está corriendo */
}

.slider:hover .slide-track {
  animation-play-state: paused; /* Pausar la animación al hacer hover */
}

.slider .slide {
  width: 310px;
  margin: 1rem;
  margin-top: 0;
  margin-bottom: 2rem;
}

@keyframes scroll {
  0% {
    transform: translateX(0);
  }
  100% {
    transform: translateX(-50%);
  }
}
</style>

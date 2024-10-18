<template>
  <transition name="slide">
    <div v-if="urlSponsors.length" class="container mx-auto p-4">

      <span
        class="text-red-500 font-bold text-lg md:text-xl lg:text-2xl block text-center w-full max-w-4xl mx-auto rounded-t-3xl uppercase pb-2">
      NUESTROS PATROCINADORES
      </span>
      <div class="max-w-7xl slider">
        <div class="slide-track mt-8">
          <!-- Duplicar los elementos para un scroll infinito -->
          <a target="_blank" v-for="(banner, index) in [...urlSponsors, ...urlSponsors]" :href="banner.link"
            :key="index"
            class="slide shadow-lg block w-full bg-center bg-cover bg-no-repeat max-w-72 md:max-w-[310px] aspect-video"
            :style="{ backgroundImage: `url(${banner.url})` }" :alt="banner.name" :title="banner.name">
          </a>
        </div>
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
      const urlImage = `${urlBase}/storage_public/${item.image}`;

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
  width: 100%;
  height: auto;
  margin: auto;
  overflow: hidden;
  -webkit-mask-image: linear-gradient(to right, transparent 0, black 10%, black 90%, transparent 100%);
  mask-image: linear-gradient(to right, transparent 0, black 10%, black 90%, transparent 100%);
}

.slider .slide-track {
  display: flex;
  animation: scroll 30s linear infinite;
  animation-play-state: running;
  /* Inicialmente, la animación está corriendo */
}

.slider:hover .slide-track {
  animation-play-state: paused;
  /* Pausar la animación al hacer hover */
}

.slider .slide {
  width: 310px;
  margin: 1rem;
  margin-top: 0;
  margin-bottom: 2rem;
}

.slider .slide:nth-of-type(odd) {
  transform: rotate(-2deg);
  transition: all ease-in-out 0.3s;
}

.slider .slide:nth-of-type(even) {
  transform: rotate(2deg);
  transition: all ease-in-out 0.3s;
}

.slider:hover .slide {
  transform: rotate(0deg);
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

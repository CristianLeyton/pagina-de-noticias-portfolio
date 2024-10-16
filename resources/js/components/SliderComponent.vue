<template>
    <div class="relative max-w-5xl mx-auto mb-8">
        <button ref="btnPrev" class="h-full absolute text-white z-10 top-0 left-0 xl:-left-20"><i
                class='bx bxs-chevron-left text-5xl md:text-6xl xl:text-7xl'></i></button>

        <div class="overflow-hidden max-w-5xl mx-auto aspect-video rounded-3xl relative">

            <div v-if="imagesArr == 0" class="carouselDiv w-5xl"
                    :style="{ backgroundImage: `url(${bannerCanal3})`}" title="Canal 3 - Banner">
            </div>


            <div v-else ref="carousel" class="flex transition-transform ease-in-out duration-[800ms] rounded-3xl"
                :style="{ width: `${100 * imagesArr.length}%` }">
                <a target="_blank" class="carouselDiv w-5xl" v-for="(image, index) in imagesArr" :key="index" :href="image.link"
                    :style="{ backgroundImage: `url(${image.url})`, width: `${100 / imagesArr.length}%` }" :title="image.name"></a>
            </div>
        </div>

        <button ref="btnNext" class="absolute text-white z-10 top-[44%] right-0 xl:-right-20"><i
                class='bx bxs-chevron-right text-5xl md:text-6xl xl:text-7xl'></i></button>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';

const bannerCanal3 = ref("./src/images/canal3-banner.webp")

const urlBase = window.location.origin;
const urlApi = `${urlBase}/api/imagenes`;

const carousel = ref(null);
const btnPrev = ref(null);
const btnNext = ref(null);
let imagesArr = ref([]);

let currentIndex = 0;
let timeout;
let intervalo;

/*Consumo la API*/
fetch(urlApi)
    .then(response => response.json())
    .then((data) => {
        data.forEach(item => {
            const urlImage = `${urlBase}/storage_public/${item.image}`;

            const image = {
                url: urlImage,
                name: item.name,
                link: item.link
            }

            imagesArr.value.push(image);
        });
    })
    .catch(err => console.error(err));

    //console.log(imagesArr.value)
/*Hasta aquí el consumo de la API*/

onMounted(() => {

        // Iniciar carrusel automático
        intervalo = setInterval(slider, 2500);

        // Manejadores de eventos para botones "Prev" y "Next"
        btnNext.value.addEventListener("click", nextSlide);
        btnPrev.value.addEventListener("click", prevSlide);

        function nextSlide() {
            if (currentIndex < imagesArr.value.length - 1) {
                currentIndex++;
            } else {
                currentIndex = 0;
            }
            changeSlide(currentIndex);
        }

        function prevSlide() {
            if (currentIndex > 0) {
                currentIndex--;
            } else {
                currentIndex = imagesArr.value.length - 1;
            }
            changeSlide(currentIndex);
        }

        function changeSlide(index) {
            clearInterval(intervalo); // Pausar el auto-slideshow
            if (timeout) {
                clearTimeout(timeout);
            }

            // Calcular el desplazamiento en función del índice actual
            const percent = (index * 100) / imagesArr.value.length;
            carousel.value.style.transform = `translateX(-${percent}%)`;

            // Reiniciar el auto-slideshow
            timeout = setTimeout(() => {
                intervalo = setInterval(slider, 2500);
            }, 1000);
        }

        function slider() {
            if (currentIndex < imagesArr.value.length - 1) {
                currentIndex++;
            } else {
                currentIndex = 0;
            }
            changeSlide(currentIndex);
        }
});


</script>

<style scoped>
.carouselDiv {
    aspect-ratio: 16/9;
    background-position: center center;
    background-size: cover;
    background-repeat: no-repeat;
    /*  border: 1px solid red; */
}
</style>

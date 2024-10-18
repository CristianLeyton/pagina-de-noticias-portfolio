<template>
  <footer class="bg-red-600 text-white p-6 md:p-12" id="contacto">
  <div class="container mx-auto flex justify-between items-center">
    <div class="flex flex-col md:flex-row md:items-center w-full flex-wrap">

    <div class="mb-6 md:mb-0 flex-grow">
      <h2 class="text-xl lg:text-3xl font-bold mb-4">NOSOTROS</h2>
      <p>Direccion: Calle falsa 123</p>
      <p>Salta, Salta - Argentina</p>
      <p>CP: 4400</p>
      <p>Celular: +54 387 123-4567</p>
      <p class="pt-2 text-pretty font-semibold">¡Mandanos un mensaje por redes sociales!</p>
    </div>

    <div class="flex space-x-4 mb-6 md:mb-0 flex-grow">
      <a href="#" class="border rounded-xl inline-flex p-0.5 hover:bg-white hover:border-red-700 hover:text-red-600 transition-colors duration-300" aria-label="YouTube" rel="ugc" title="Canal de Youtube">
        <i class='bx bxl-instagram-alt text-5xl'></i>
      </a>
      <a href="#" class="border rounded-xl inline-flex p-0.5 hover:bg-white hover:border-red-700 hover:text-red-600 transition-colors duration-300" aria-label="Facebook" rel="ugc" title="Página de Facebook">
        <i class='bx bxl-facebook-square text-5xl' ></i>
      </a>
      <a href="#" class="border rounded-xl inline-flex p-0.5 hover:bg-white hover:border-red-700 hover:text-red-600 transition-colors duration-300" aria-label="WhatsApp" rel="ugc" title="Contáctanos por WhatsApp">
        <i class='bx bxl-whatsapp-square text-5xl'></i>
      </a>
    </div>
    </div>

    <div class="flex items-center aspect-square">
      <span alt="Logo C3" class="block ">
        <a href="/" title="Canal 3 - Salta" class="">
                <LogoComponent />
        </a>
    </span>
    </div>
  </div>
  <div class="border-t border-white mt-6 pt-4 text-center text-sm">
    <a href="https://www.cdl.net.ar/" target="_blank">Desarrollado por <span  class="font-iceberg text-base">{CDL}</span> - Wuaze TV | Ningun derecho reservado</a>
  </div>
</footer>
</template>

<script setup>
import LogoComponent from './images/LogoComponent.vue';

  
</script>

<style scoped>
  
</style>

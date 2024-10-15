<template>
  <footer class="bg-red-600 text-white p-6 md:p-12" id="contacto">
  <div class="container mx-auto flex justify-between items-center">
    <div class="flex flex-col md:flex-row md:items-center w-full flex-wrap">

    <div class="mb-6 md:mb-0 flex-grow mr-16">
      <h2 class="text-xl lg:text-3xl font-bold mb-4">NOSOTROS</h2>
      <p>Direccion: Gauchos de Güemes 827</p>
      <p>Vaqueros, Salta - Argentina</p>
      <p>CP: 4401</p>
      <p>Celular: +54 387 418-3423</p>
      <p class="text-pretty">¡Mandanos un mensaje por redes sociales!</p>
    </div>

    <div class="flex space-x-4 mb-6 md:mb-0 flex-grow">
      <a href="#" aria-label="YouTube" rel="ugc" title="Canal de Youtube">
        <i class='bx bxl-youtube text-5xl' ></i>
      </a>
      <a href="#" aria-label="Facebook" rel="ugc" title="Página de Facebook">
        <i class='bx bxl-facebook-square text-5xl' ></i>
      </a>
      <a href="#" aria-label="WhatsApp" rel="ugc" title="Contáctanos por WhatsApp">
        <i class='bx bxl-whatsapp text-5xl'></i>
      </a>
    </div>
    </div>

    <div class="flex items-center aspect-square">
      <span alt="Logo C3" class="block scale-150 -translate-x-10 sm:translate-x-0">
        <a href="/" title="Canal 3 - Salta" class="">
                <LogoComponent />
        </a>
    </span>
    </div>
  </div>
  <div class="border-t border-white mt-6 pt-4 text-center text-sm">
    Desarrollado por D'ambrosio Studio | Canal 3 TV - Todos los derechos reservados
  </div>
</footer>
</template>

<script setup>
import LogoComponent from './images/LogoComponent.vue';

  
</script>

<style scoped>
  
</style>

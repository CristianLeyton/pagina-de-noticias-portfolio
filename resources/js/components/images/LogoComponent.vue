<template>
    <!-- Usa la interpolación para enlazar la ruta de la imagen -->
    <!-- <img :src="logo" alt="Logo" class="w-40"> -->
    <p class="font-light text-5xl md:text-4xl md:py-3 lg:py-1 lg:text-6xl py-1 font-adonis">Wuaze</p>
  </template>
  
  <script setup>
  import { ref } from 'vue';
  

  const urlBase = window.location.origin;
  // Importa la imagen y usa ref para enlazarla en el template
  const logo = ref(`${urlBase}/src/images/logo500x250.svg`);
  </script>
  
  <style>
  /* Estilos específicos del componente */

  .font-adonis {
    font-family: 'Adonis';
  }

  .font-iceberg {
    font-family: 'Iceberg';
  }

  @font-face {
    font-family: 'Adonis';
    src: url('../../../../public/src/fonts/ADONIS.TTF');
  }

  @font-face {
    font-family: 'Iceberg';
    src: url('../../../../public/src/fonts/Iceberg.TTF');
  }

  </style>
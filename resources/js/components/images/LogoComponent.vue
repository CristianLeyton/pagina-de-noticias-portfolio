<template>
    <!-- Usa la interpolación para enlazar la ruta de la imagen -->
    <img :src="logo" alt="Logo" class="size-16">
  </template>
  
  <script setup>
  import { ref } from 'vue';
  

  const urlBase = window.location.origin;
  // Importa la imagen y usa ref para enlazarla en el template
  const logo = ref(`${urlBase}/src/images/logo250x250.webp`);
  </script>
  
  <style scoped>
  /* Estilos específicos del componente */
  </style>
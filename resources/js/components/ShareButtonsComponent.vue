<template>
  <div class="share-buttons flex items-center justify-end gap-2 relative">
      <!-- Botones de compartir -->
      <button @click="shareOnFacebook" title="Compartir en Facebook" class="bg-blue-500 w-9 aspect-square text-white rounded-full grid place-content-center hover:bg-blue-600">
          <i class='bx bxl-facebook text-2xl'></i>
      </button>
      <button @click="shareOnWhatsApp" title="Compartir en Whatsapp" class="bg-green-500 w-9 aspect-square text-white rounded-full grid place-content-center hover:bg-green-600">
          <i class='bx bxl-whatsapp text-2xl'></i>
      </button>
      <button @click="shareOnX" title="Compartir en X" class="bg-cyan-400 w-9 aspect-square text-white rounded-full grid place-content-center hover:bg-cyan-500">
          <i class='bx bxl-twitter text-xl'></i>
      </button>
      <button @click="copyLink" title="Copiar al portapapeles" class="bg-gray-700 w-9 aspect-square text-white rounded-full grid place-content-center hover:bg-gray-900">
          <i class='bx bx-copy-alt'></i>
      </button>

      <!-- Mensaje de enlace copiado -->
      <span v-if="copied" class="absolute -bottom-7 -right-8 p-1 text-gray-700 ml-4 text-xs font-semibold bg-white rounded-lg">¡Enlace copiado!</span>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { defineProps } from 'vue';

const props = defineProps({
  noticiaTitle: String,  // Recibir el título como prop
});

const noticiaUrl = window.location.href;
const copied = ref(false);

const shareOnWhatsApp = () => {
  const url = `https://api.whatsapp.com/send?text=${encodeURIComponent(props.noticiaTitle)}%20${encodeURIComponent(noticiaUrl)}`;
  window.open(url, '_blank');
};

const shareOnFacebook = () => {
  const url = `https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(noticiaUrl)}`;
  window.open(url, '_blank');
};

const shareOnX = () => {
  const url = `https://twitter.com/intent/tweet?text=${encodeURIComponent(props.noticiaTitle)}&url=${encodeURIComponent(noticiaUrl)}`;
  window.open(url, '_blank');
};

const copyLink = () => {
  if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(noticiaUrl)
      .then(() => {
          copied.value = true;
          setTimeout(() => {
              copied.value = false;
          }, 2000);
      })
      .catch(err => {
          console.error("Error al copiar el enlace: ", err);
      });
  } else {
      const tempInput = document.createElement('input');
      tempInput.value = noticiaUrl;
      document.body.appendChild(tempInput);
      tempInput.select();
      document.execCommand('copy');
      document.body.removeChild(tempInput);

      copied.value = true;
      setTimeout(() => {
          copied.value = false;
      }, 2000);
  }
};
</script>


<style scoped>
.share-buttons button {
    transition: background-color 0.3s;
}
</style>
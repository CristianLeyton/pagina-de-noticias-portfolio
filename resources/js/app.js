import './bootstrap';
import { createApp } from 'vue';
import '../css/app.css';  // Importa Tailwind CSS
import HeaderComponent from './components/HeaderComponent.vue'; // Importa el componente Vue
import EnVivoComponent from './components/EnVivoComponent.vue';
import SliderComponent from './components/SliderComponent.vue';
import AnunciosComponent from './components/AnunciosComponent.vue';
import NoticiasComponent from './components/NoticiasComponent.vue';
import FooterComponent from './components/FooterComponent.vue';
import SponsorsComponent from './components/SponsorsComponent.vue';
import ShareButtonsComponent from './components/ShareButtonsComponent.vue';
import NoticiasPageComponent from './components/NoticiasPageComponent.vue';

const app = createApp({});

app.component('header-component', HeaderComponent); // Registra el componente
app.component('en-vivo-component', EnVivoComponent); // Registra el componente
app.component('slider-component', SliderComponent); // Registra el componente
app.component('anuncios-component', AnunciosComponent); // Registra el componente
app.component('noticias-component', NoticiasComponent); // Registra el componente
app.component('footer-component', FooterComponent); // Registra el componente
app.component('sponsors-component', SponsorsComponent); // Registra el componente
app.component('share-component', ShareButtonsComponent); // Registra el componente
app.component('noticias-page-component', NoticiasPageComponent); // Registra el componente

app.mount('#app'); // Monta la aplicación en el DOM
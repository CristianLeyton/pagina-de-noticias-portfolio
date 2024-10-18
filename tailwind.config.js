/** @type {import('tailwindcss').Config} */
export default {
  content: [
    './resources/**/*.blade.php',
    './resources/**/*.js',
    './resources/**/*.vue',
  ],
  theme: {
    extend: {
      colors: {
        'white': '#ffffff',
        'transparent': 'transparent',
        'red': {
          500: '#0070ac',
          600: '#003049',
          700: '#210646',
        },
        // ...
      }
    },
  },
  plugins: [],
}


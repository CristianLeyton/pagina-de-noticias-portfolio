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
          500: '#e21b4d',
          600: '#FF0043',
          700: '#CC0036',
        },
        // ...
      }
    },
  },
  plugins: [],
}


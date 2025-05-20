/** @type {import('tailwindcss').Config} */
export default {
  content: [
    './index.html', './src/**/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {
      colors: {
        metrocolor: '#BBDE1A',
      }
    },
  },
  plugins: [],
}


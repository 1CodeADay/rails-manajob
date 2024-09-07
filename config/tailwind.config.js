const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      boxShadow: {
        'navbar': '0px 0px 15px black', // Customize as needed
        'profile-menu': '0px 0px 15px black',
        'profile-button': '0px 0px 15px black',
      },
      colors: {
        'rod': '#243c5a',
        'navbar-grey': '#6c757d',
        'gold': '#feb62f',
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    // require('@tailwindcss/forms'),
    // require('@tailwindcss/typography'),
    // require('@tailwindcss/container-queries'),

  ]
}

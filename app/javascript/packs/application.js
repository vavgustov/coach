import { start } from 'rails-ujs'
import '../styles/application.scss'

import '../images/favicon.ico'
import '../images/apple-touch-icons/apple-touch-icon.png'
import '../images/apple-touch-icons/apple-touch-icon-57x57.png'
import '../images/apple-touch-icons/apple-touch-icon-72x72.png'
import '../images/apple-touch-icons/apple-touch-icon-76x76.png'
import '../images/apple-touch-icons/apple-touch-icon-114x114.png'
import '../images/apple-touch-icons/apple-touch-icon-120x120.png'
import '../images/apple-touch-icons/apple-touch-icon-144x144.png'
import '../images/apple-touch-icons/apple-touch-icon-152x152.png'
import '../images/apple-touch-icons/apple-touch-icon-180x180.png'

document.addEventListener('DOMContentLoaded', () => {
  start()

  // navbar toggle
  // based on https://bulma.io/documentation/components/navbar/
  let $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0)
  if ($navbarBurgers.length > 0) {
    $navbarBurgers.forEach($el => {
      $el.addEventListener('click', () => {
        let target = $el.dataset.target
        let $target = document.getElementById(target)
        $el.classList.toggle('is-active')
        $target.classList.toggle('is-active')
      })
    })
  }
})

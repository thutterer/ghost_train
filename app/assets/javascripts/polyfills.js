//= require polyfills/dialog-polyfill

dialog = undefined // global for easy access in SJR

function installPolyfills () {
  dialog = document.querySelector('dialog')
  dialogPolyfill.registerDialog(dialog)
}

// On first page load
installPolyfills()

// On every Turbo visit
document.addEventListener("turbo:load", function() {
  installPolyfills()
})

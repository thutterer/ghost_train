//= require polyfills/dialog-polyfill

function installPolyfills () {
  // Set global `dialog` variable for easy access in SJR
  dialog = document.querySelector('dialog')
  dialogPolyfill.registerDialog(dialog)
}

// On first page load
installPolyfills()

// On every Turbo visit
document.addEventListener("turbo:load", function() {
  installPolyfills()
})

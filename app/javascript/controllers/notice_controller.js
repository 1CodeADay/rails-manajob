import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["notice"]

  connect() {
    this.fadeOutTimeout = setTimeout(() => {
      this.fadeOut()
    }, 2000) // Wait 2 seconds before starting to fade out

    // Add an event listener for clicks on the document
    document.addEventListener('click', this.handleClickOutside.bind(this))
  }

  disconnect() {
    // Clean up event listener when the controller is disconnected
    document.removeEventListener('click', this.handleClickOutside.bind(this))
  }

  fadeOut() {
    this.noticeTarget.classList.add("opacity-0")
    setTimeout(() => {
      this.noticeTarget.remove()
    }, 1000) // Wait 1 second for the fade-out transition to complete
  }

  handleClickOutside(event) {
    // If the click is outside the notice, fade it out
    if (!this.noticeTarget.contains(event.target)) {
      clearTimeout(this.fadeOutTimeout) // Clear the timeout if the user clicks outside
      this.fadeOut()
    }
  }
}

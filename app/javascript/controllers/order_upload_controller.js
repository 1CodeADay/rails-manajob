import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["inputo", "labelo"]

  connect() {
    this.updateLabel()
  }

  updateLabel() {
    const fileInput = this.inputoTarget
    const label = this.labeloTarget

    fileInput.addEventListener("change", () => {
      if (fileInput.files.length > 0) {
        label.textContent = fileInput.files[0].name
      } else {
        label.textContent = "No file"
      }
    })
  }
}

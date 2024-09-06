import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["inputc", "labelc"]

  connect() {
    this.updateLabel()
  }

  updateLabel() {
    const fileInput = this.inputcTarget
    const label = this.labelcTarget

    fileInput.addEventListener("change", () => {
      if (fileInput.files.length > 0) {
        label.textContent = fileInput.files[0].name
      } else {
        label.textContent = "No file"
      }
    })
  }
}

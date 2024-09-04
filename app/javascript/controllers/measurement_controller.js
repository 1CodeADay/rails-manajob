import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="measurement"
export default class extends Controller {
  static targets = [ "form", "dimension", "title" ]
  connect() {
    console.log("Hello, Stimulus!",  document.getElementById("create"))

  }
  showForm() {
    document.getElementById("create").addEventListener("click", () => console.log("create dimension") )
    Swal.fire({
      title: 'Create a dimension !',
      confirmButtonText: 'Create dimension',
      html: this.formTarget.innerHTML
    }).then((result) => {
      if (result.isConfirmed) {

        Swal.fire({
          title: "Dimension created!",
          text: "Dimension created",
          icon: "success"
        });
      }
    })

  }

  createDimension() {
    console.log("create dimension")
    console.log(this.dimensionTarget.value)
    console.log(this.titleTarget.value)
  }
}

import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="measurement"
export default class extends Controller {
  static targets = [ "form","addmeasurement","orderform"]
  connect() {

  }
  async showPopup() {
    const { value: formValues } = await Swal.fire({
      title: "Add a client measurement",
      html: `
        <input id="swal-type" class="swal2-input" placeholder="Clothes Type">
        <input id="swal-title" class="swal2-input" placeholder="Measure title">
        <input type="number" id="swal-dimension" class="swal2-input" step="0.01" min="0"  placeholder="Dimension in cm">
      `,
      focusConfirm: false,
      preConfirm: () => {
        return {
          type: document.getElementById("swal-type").value,
          title: document.getElementById("swal-title").value,
          dimension: document.getElementById("swal-dimension").value,
          clientId: document.getElementById("swal-clientId").value,
        };
      }
    });

    if (formValues) {
      console.log(JSON.stringify(formValues))
      const response = await fetch("/item_measurements", {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json" // Ensure Rails knows this is JSON
        },
        body: JSON.stringify(formValues)
      });

      if (response.ok) {
        // Fire Swal if response is OK
        Swal.fire({
          title: 'Success!',
          text: "Mesurement added successfully",
          icon: 'success',
          confirmButtonText: 'OK'
        }).then(() => {
          document.location.reload()
        });
      }
    }

  }

  selected() {
    this.addmeasurementTarget.classList.remove("hidden")
  }

  showOrderForm(){
    this.orderformTarget.classList.remove("hidden")

  }


}

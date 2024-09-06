import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from 'chart.js';

export default class extends Controller {
  static values = {
    config: Object
  }

  connect() {
    Chart.register(...registerables); // Register necessary Chart.js components

    const ctx = this.element.getContext('2d'); // Get the canvas element's context

    new Chart(ctx, this.configValue); // Initialize the chart
  }
}

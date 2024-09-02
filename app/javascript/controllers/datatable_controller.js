import { Controller } from "@hotwired/stimulus"
import DataTable from "datatables.net-dt"
// Connects to data-controller="datatable"
export default class extends Controller {
  connect() {
    new DataTable('#example');
  }
}

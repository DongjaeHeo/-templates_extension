import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["list"];
  connect() {
    console.log("yay");
  }

  open_list(event) {
    this.listTarget.classList.toggle("d-none");
  }
}

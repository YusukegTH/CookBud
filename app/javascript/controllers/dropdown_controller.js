import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  connect() {
    consolejson.log('Connected to dropdown controller')
  }

  toggle(event) {
    console.log(event.target);
    event.target.classList.toggle('custom-btn-active');
    event.target.classList.toggle('custom-btn');
  }
}

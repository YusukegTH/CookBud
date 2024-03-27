import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  connect() {
  }

  toggle(event) {
    event.preventDefault();
    event.target.classList.toggle('custom-btn-active');
    event.target.classList.toggle('custom-btn');
    event.target.closest('div').querySelector('.recipe-dropdown').classList.toggle('d-none');
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmark"
export default class extends Controller {
  connect() {
  }

  toggle(event) {
    event.target.closest('div').querySelector('#bookmarked').classList.toggle('d-none');
    event.target.closest('div').querySelector('#not-bookmarked').classList.toggle('d-none');
  }
}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["editForm"]

  toggleEditForm() {
    this.editFormTarget.classList.toggle('d-none');
  }
}

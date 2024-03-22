import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cooking"
export default class extends Controller {
  static values = { index: Number }

  connect() {
    console.log("Hello, Stimulus!", this.element)
    this.indexValue = 0
    document.querySelectorAll("#instruction")[this.indexValue].classList.toggle("d-none");
  }

  next(event){
    if (this.indexValue < (document.querySelectorAll("#instruction").length - 1)) {
      document.querySelectorAll("#instruction")[this.indexValue].classList.toggle("d-none");
      this.indexValue += 1;
      document.querySelectorAll("#instruction")[this.indexValue].classList.toggle("d-none");
    }
    if (this.indexValue == (document.querySelectorAll("#instruction").length - 1)) {
      document.querySelector("#end-button").classList.toggle("d-none");
    }
  }

  previous(event){
    if (this.indexValue > 0) {
      document.querySelectorAll("#instruction")[this.indexValue].classList.toggle("d-none");
    this.indexValue -= 1;
    document.querySelectorAll("#instruction")[this.indexValue].classList.toggle("d-none");
    };
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-results"
export default class extends Controller {
  connect() {
    console.log(document.querySelectorAll(".search-results")[document.querySelectorAll(".search-results").length - 1])
    document.querySelectorAll(".search-results")[document.querySelectorAll(".search-results").length - 1].classList.add("d-none");

  }

  load(event){
    setTimeout(() => {
      document.querySelectorAll(".search-results")[document.querySelectorAll(".search-results").length - 1].classList.toggle("d-none");
    }, 1000);
  }
}

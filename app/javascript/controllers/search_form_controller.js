import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-form"
export default class extends Controller {

  connect() {
    console.log("Connected!")
  }

  addToList(event) {
    event.preventDefault();
    const idName = event.target.closest('div').parentNode.querySelector('label').innerText.toLowerCase();
    const html = `<li class="list-group-item bg-white">
            <div class="d-flex justify-content-start align-items-center">
              <p id='${idName}' class="my-1 flex-grow-1">${event.target.closest('div').querySelector('input').value}</p>
              <div data-action="click->search-form#delete" class="mx-3"><i class="fa-solid fa-circle-xmark"></i></div>
            </div>
          </li>`;

    event.target.closest('div').parentNode.querySelector('ul').insertAdjacentHTML('afterbegin', html);
    event.target.closest('div').querySelector('input').value = "";
  }

  toggleList(event) {
    event.preventDefault();
    event.target.closest('div').parentNode.querySelector('ul').classList.toggle('d-none');
  }

  delete(event) {
    event.preventDefault();
    event.target.closest('li').remove();
  }

  search(event) {
    event.preventDefault();
    let appliances = "";
    let ingredients = "";
    let diet = "";
    let allergies = "";
    const level = document.querySelector('#level').value.toLowerCase();
    const duration = document.querySelector('#duration').value.toLowerCase();
    const searchAppliances = document.querySelectorAll('#appliances');
    searchAppliances.forEach((appliance) => {
      appliances += `${appliance.innerText.toLowerCase()},`;
    });
    const searchIngredients = document.querySelectorAll('#ingredients');
    searchIngredients.forEach((ingredient) => {
      ingredients += `${ingredient.innerText.toLowerCase()},`;
    });
    const searchDiet = document.querySelectorAll('#diet');
    searchDiet.forEach((diet) => {
      diet += `${diet.innerText.toLowerCase()},`;
    });
    const searchAllergies = document.querySelectorAll('#allergies');
    searchAllergies.forEach((allergy) => {
      allergies += `${allergy.innerText.toLowerCase()},`;
    });
    const url = "/search_results";
    const params = new URLSearchParams({
      appliances: appliances,
      ingredients: ingredients,
      diet: diet,
      allergies: allergies,
      level: level,
      duration: duration
    });
    window.location.href = `${url}?${params}`;

  }

}

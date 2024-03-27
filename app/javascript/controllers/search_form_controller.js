import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-form"
export default class extends Controller {


  connect() {
    console.log("Connected!")
  }

  addToList(event) {
    event.preventDefault();
    const idName = event.target.closest('div').parentNode.dataset.category;
    console.log(idName);
    const html = `<li class="preference-list-item-box">
                    <p id='${idName}' class="my-1 flex-grow-1">${event.target.closest('div').querySelector('input').value}</p>
                    <div data-action="click->search-form#delete" class="mx-3" style="color: $c_primary;"><i class="fa-solid fa-xmark"></i></div>
                  </li>`;

    event.target.closest('div').parentNode.querySelector('ul').insertAdjacentHTML('afterbegin', html);
    event.target.closest('div').querySelector('input').value = "";
  }

  toggleList(event) {
    event.preventDefault();
    event.target.classList.toggle('custom-btn-active');
    event.target.classList.toggle('custom-btn');
    event.target.closest('div').querySelector('.input-list').classList.toggle('d-none');
  }

  delete(event) {
    event.preventDefault();
    event.target.closest('li').remove();
  }

  search(event) {
    event.preventDefault();
    let appliances = [];
    let ingredients = [];
    let diet = [];
    let allergies = [];
    const level = document.querySelector('#level').value.toLowerCase();
    const duration = document.querySelector('#duration').value.toLowerCase();
    const searchAppliances = document.querySelectorAll('#appliances');
    searchAppliances.forEach((appliance) => {
      appliances.push(appliance.innerText.toLowerCase());
    });
    const searchIngredients = document.querySelectorAll('#ingredients');
    searchIngredients.forEach((ingredient) => {
      ingredients.push(ingredient.innerText.toLowerCase());
    });
    const searchDiet = document.querySelectorAll('#diet');
    searchDiet.forEach((diet_item) => {
      diet.push(diet_item.innerText.toLowerCase());
    });
    const searchAllergies = document.querySelectorAll('#allergies');
    searchAllergies.forEach((allergy) => {
      allergies.push(allergy.innerText.toLowerCase());
    });
    const url = "/search_results";
    const search = {
      appliances: appliances,
      ingredients: ingredients,
      diet: diet,
      allergies: allergies,
      level: level,
      duration: duration
    };
    const params = new URLSearchParams({
      search: JSON.stringify(search),
      filtered_recipes: [],
      generated_recipes: [],
      generate: false
    });
    window.location.href = `${url}?${params}`;

  }

}

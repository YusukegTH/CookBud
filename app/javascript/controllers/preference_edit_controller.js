import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="preference-edit"
export default class extends Controller {


  connect() {
  }

  addToList(event) {
    event.preventDefault();
    const idName = event.target.closest('div').parentNode.dataset.category;
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

  edit(event) {
    console.log(this.preferenceIdValue);
    const url = `/preferences/${this.element.dataset.preferenceId}`;
    event.preventDefault();
    let appliances = [];
    let ingredients = [];
    let diet = [];
    let allergies = [];
    const level = document.querySelector('#level').value.toLowerCase();
    const editAppliances = document.querySelectorAll('#appliances');
    editAppliances.forEach((appliance) => {
      appliances.push(appliance.innerText.toLowerCase());
    });
    const editIngredients = document.querySelectorAll('#ingredients');
    editIngredients.forEach((ingredient) => {
      ingredients.push(ingredient.innerText.toLowerCase());
    });
    const editDiet = document.querySelectorAll('#diet');
    editDiet.forEach((diet_item) => {
      diet.push(diet_item.innerText.toLowerCase());
    });
    const editAllergies = document.querySelectorAll('#allergies');
    editAllergies.forEach((allergy) => {
      allergies.push(allergy.innerText.toLowerCase());
    });
    const params = {
      user_id: this.element.dataset.userId,
      appliances: appliances,
      ingredients: ingredients,
      diet: diet,
      allergies: allergies,
      level: level
    };
    console.log(JSON.stringify(params));
    fetch(`${url}`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        // Include the CSRF token in the request header for Rails to authenticate the request
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify(params),
    })
    // .then(response => response.json())
    .then(data => {
        console.log('Success:', params);
        window.location.href = "/profile";
      })
    .catch((error) => {
      console.error('Error:', error);
    });

  }
}

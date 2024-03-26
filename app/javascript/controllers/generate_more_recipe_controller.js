import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {

  }

  async loadMoreRecipes(event) {
    try {
      event.preventDefault();

      const response = await fetch("/load_more_recipes");

      if (response.ok) {
        const data = await response.json();

        console.log(data);
        const newRecipe = data.recipe;

        const recipeCard = document.createElement("div");
        recipeCard.classList.add("col-md-12", "mb-4", "search-results");
        recipeCard.innerHTML = `
          <div class="card recipe-card">
            <a href="/recipes/${newRecipe.id}">
              <img src="${newRecipe.photo_url}" alt="Recipe Photo" class="img-fluid">
              <div class="card-body">
                <h3 class="card-title">${newRecipe.name}</h3>
                <p class="card-subtitle mb-2 text-muted">${newRecipe.description.substring(0, 70)}</p>
                <div class="card-footer d-flex justify-content-between">
                  <small class="text-muted">${newRecipe.difficulty.capitalize()}</small>
                  <small class="text-muted">⏲️ ${newRecipe.duration}</small>
                </div>
              </div>
            </a>
          </div>`;

        const recipeContainer = document.querySelector("[data-controller='search-results'] .row");
        recipeContainer.appendChild(recipeCard);
      } else {
        console.error("Error loading more recipes:", response.statusText);
      }
    } catch (error) {
      console.error("Error loading more recipes:", error);
    }
  }
}

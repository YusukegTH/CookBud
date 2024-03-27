import { Controller } from "@hotwired/stimulus"

// Change the params passed from the search page {filtered_results : [], generated_recipes: [], generate: true or false}
// Add to filtered_results the new recipe
// pass the filtered results from search result page


// Connects to data-controller="ai-activator"
export default class extends Controller {
  connect() {
    // this.element.querySelectorAll(".search-results").forEach((element) => {
    //   console.log(element.dataset.recipeId);
    // });
  }

  loadMore(event) {
    event.preventDefault();
    const url = "/search_results";
    const search = JSON.parse(this.element.dataset.search);
    let filtered_recipes = [];
    this.element.querySelectorAll(".search-results").forEach((element) => {
      filtered_recipes.push(element.dataset.recipeId);
    });
    console.log(filtered_recipes)
    const params = new URLSearchParams({
      search: JSON.stringify(search),
      filtered_recipes: JSON.stringify(filtered_recipes),
      generate: JSON.stringify(true)
    });
    window.location.href = `${url}?${params}`;
  }
}

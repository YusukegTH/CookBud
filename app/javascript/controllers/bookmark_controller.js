import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmark"
export default class extends Controller {
  connect() {
  }

  delete(event) {
    event.target.classList.remove("fa-solid", "fa-star");
    event.target.classList.add("fa-regular", "fa-star");
    // event.target.closest('div').querySelector('#bookmarked').classList.toggle('d-none');
    // event.target.closest('div').querySelector('#not-bookmarked').classList.toggle('d-none');
    const url = `/bookmarks/${event.target.dataset.bookmarkId}`;
    fetch(url, {
      method: 'DELETE',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        // Include the CSRF token in the request header for Rails to authenticate the request
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
      })
  }

  add(event) {
    event.target.classList.remove("fa-regular", "fa-star");
    event.target.classList.add("fa-solid", "fa-star");
    // event.target.closest('div').querySelector('#bookmarked').classList.toggle('d-none');
    // event.target.closest('div').querySelector('#not-bookmarked').classList.toggle('d-none');
    const url = `/recipes/${event.target.dataset.recipeId}/bookmarks`;
    const params = {
      recipe_id: event.target.dataset.recipeId,
      user_id: event.target.dataset.userId
    };
    console.log(params);
    fetch(url, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        // Include the CSRF token in the request header for Rails to authenticate the request
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify(params),
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
      })
  }
}

import { Controller } from "@hotwired/stimulus"

// Change the params passed from the search page {filtered_results : [], generated_recipes: [], generate: true or false}
// Add to filtered_results the new recipe
// pass the filtered results from search result page


// Connects to data-controller="ai-activator"
export default class extends Controller {

  static values = { quotes: ["Humans have been cooking for millions of years. If you feel uncomfortable in the kitchen, you’re not alone. But remember that humans have been cooking for a very long time, we’re talking since about 2 million years ago. And the earliest oven dates back to 29,000 B.C. So take a step back and be confident!",
                            "Cooking leads to more mindful eating. According to studies, people eat more mindful portions when they make home-cooked meals. While there’s so much in life we cannot control, cooking puts you in control of every ingredient you use and the portions you eat.",
                            "It’s a proven stress-relieving practice. Studies show that baking and cooking helps relieve stress. In fact, it’s often suggested as an activity to help with anxiety and depression. Experts say the soothing act of cooking helps boost confidence and keeps thoughts focused to ultimately avoid negative self-talk.",
                            "Your plates might make a difference in your taste. According to NPR, “In general, round, white plates tend to enhance sweet flavors in food, whereas black, angular plates tend to bring out more savory flavors… And serving food on a red plate tends to reduce the amount diners eat.” Now you know!",
                            "Bananas are berries (but strawberries aren’t). This is a fun fact that reminds us there’s always so much more to learn about the foods we eat every day. Just when we think we know it all, we learn something new.",
                            "Salt is a universal flavor enhancer. Adding salt is a flavor enhancer shown to improve the “sensory properties'' of essentially every food. So if you want to cut down on your salt intake, it’s recommended to dial it back slowly in your cooking practices while also skipping processed food, cutting back on condiments, and dialing up peppers to substitute for flavor.",
                            "Fun fact: if you need to cool down your drink, don’t stir. Blowing in your hot drink (or lifting it with your spoon) is more efficient to cool it down compared to stirring. Why? Stirring adds kinetic energy to the drink, which increases its temperature. So if you’re trying our Masala Chai or a soup dish, keep this tip in mind!",
                            "Cooking is a form of altruism. Research has shown that altruistic cooking and sharing food has a strong, bonding role in many cultures. Think of times of celebration, crisis, connection, and entertaining. Is food often at the center of those experiences? We thought so! Cooking is a way to give back to others just as much as it’s a way to give love to ourselves."
                          ]
                  }
  connect() {
  }

  loadMore(event) {
    event.preventDefault();
    const url = "/search_results";
    const search = JSON.parse(this.element.dataset.search);
    let filtered_recipes = [];
    this.element.querySelectorAll(".search-results").forEach((element) => {
      filtered_recipes.push(element.dataset.recipeId);
    });
    event.target.innerText = "Loading..."
    const randomIndex = Math.floor(Math.random() * this.quotesValue.length);
    const randomQuote = this.quotesValue[randomIndex];
    document.querySelector(".loading-message").querySelector("p").innerText = randomQuote;
    document.querySelector(".loading-message-container").classList.remove("d-none");
    console.log(document.querySelector(".loading-message-container"));
    const params = new URLSearchParams({
      search: JSON.stringify(search),
      filtered_recipes: JSON.stringify(filtered_recipes),
      generate: JSON.stringify(true)
    });
    window.location.href = `${url}?${params}`;
  }
}

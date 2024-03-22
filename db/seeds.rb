# Destroy all existing records
puts 'Destroying existing records...'
User.destroy_all
Preference.destroy_all
Recipe.destroy_all
Review.destroy_all

# appliances = ["stove", "microwave", "hot plate", "oven", "blender", "toaster"]
# ingredients = ["tomatoes", "potatoes", "salt", "pepper", "rice", "pasta", "chicken", "beef", "pork", "fish", "shrimp", "lettuce", "spinach", "carrots", "onions", "garlic", "mushrooms", "bell peppers", "broccoli", "zucchini", "avocado", "bananas", "apples", "oranges", "strawberries", "blueberries", "raspberries", "blackberries", "mangoes", "pineapples", "peaches", "watermelon", "cantaloupe", "honeydew", "kiwi", "grapes", "lemons", "limes", "coconut", "olive oil", "butter", "milk", "cheese", "yogurt", "eggs", "flour", "sugar", "honey", "maple syrup", "soy sauce", "vinegar", "mustard", "mayonnaise", "ketchup", "salsa", "hot sauce", "bbq sauce", "ranch", "italian dressing", "caesar dressing", "peanut butter", "jelly", "bread", "tortillas", "bagels", "muffins", "pancakes", "waffles", "cereal", "granola", "oatmeal", "popcorn", "chips", "crackers", "cookies", "brownies", "cake", "pie", "ice cream", "sorbet", "frozen yogurt", "chocolate", "candy", "nuts", "seeds", "dried fruit", "jerky", "protein bars", "protein powder", "vitamins", "supplements", "medication", "alcohol", "coffee", "tea", "soda", "juice", "water", "milk", "smoothie", "shake", "cocktail", "beer", "wine", "liquor", "champagne", "sparkling water", "sparkling juice", "sparkling wine", "sparkling cider", "sparkling tea", "sparkling coffee", "sparkling milk", "sparkling smoothie", "sparkling shake", "sparkling cocktail", "sparkling beer", "sparkling liquor", "sparkling champagne", "sparkling sparkling water", "sparkling sparkling juice", "sparkling sparkling wine"]
# diet = ["vegetarian", "vegan", "pescatarian", "keto", "paleo", "gluten-free"]
# allergies = ["peanuts", "dairy", "gluten", "shellfish", "soy", "eggs", "wheat"]
# level = ["beginner", "intermediate", "advanced"]
# instructions = ["boil", "fry", "bake", "microwave", "blend", "roast"]

# i = 1

# 3.times do
#   user_attributes = {
#     email: "email#{i}@email.com",
#     password: "password#{i}",
#     first_name: "first_name#{i}",
#     last_name: "last_name#{i}",
#     username: "username#{i}",
#   }

#   preference_attributes = {
#     appliances: appliances.sample(4),
#     ingredients: ingredients.sample(5),
#     diet: diet.sample(2),
#     allergies: allergies.sample(2),
#     level: level.sample
#   }

#   recipe_attributes = {
#     name: "recipe#{i}",
#     description: "description#{i}",
#     ingredients: ingredients.sample(3),
#     appliances: appliances.sample(3),
#     instructions: instructions.sample(4),
#     duration: rand(10..60),
#     difficulty: level.sample,
#     diet: diet.sample(2)
#   }

#   review_attributes = {
#     rating: rand(1..5),
#     comment: "comment#{i}"
#   }

#   user = User.new(user_attributes)
#   preference = Preference.new(preference_attributes)
#   preference.user = user
#   user.save!
#   preference.save!

#   recipe = Recipe.new(recipe_attributes)
#   recipe.save!
#   review = Review.new(review_attributes)
#   review.recipe = recipe
#   review.user = user
#   review.save!

#   i += 1
# end

# Seeds for the demo

# User 1
test_user1_atttributes = {
  email: "john_peterson@gmail.com",
  password: "cookbud",
  first_name: "John",
  last_name: "Peterson",
  username: "johnny_p1"
}

test_user1_preference_attributes = {
  appliances: ["oven", "blender", "toaster", "microwave", "hot plate", "frying pan", "knife", "cutting board", "pan", "pot"],
  ingredients: ["peanut butter", "sugar", "eggs", "flour", "baking soda", "salt", "red wine", "salt", "pepper", "rice", "spaghetti", "tomatoes", "onions", "garlic", "olive oil", "butter", "sour cream", "milk", "cheese", "eggs", "flour", "sugar", "honey", "soy sauce", "vinegar", "mustard", "mayonnaise", "ketchup", "ground beef", "chicken breasts", "shrimp", "eggplant", "zucchini", "carrots", "bacon"],
  diet: [],
  allergies: [],
  level: "intermediate"
}

test_user1 = User.new(test_user1_atttributes)
test_user1_preference = Preference.new(test_user1_preference_attributes)
test_user1_preference.user = test_user1
test_user1.save!
test_user1_preference.save!

# User 2
test_user2_atttributes = {
  email: "emily_smith@gmail.com",
  password: "cookbud",
  first_name: "Emily",
  last_name: "Smith",
  username: "EmilyS"
}

test_user2_preference_attributes = {
  appliances: ["oven", "blender", "toaster", "microwave", "hot plate", "frying pan", "knife", "cutting board", "pan", "pot"],
  ingredients: ["peanut butter", "sugar", "eggs", "flour", "baking soda", "salt", "red wine", "salt", "pepper", "rice", "spaghetti", "tomatoes", "onions", "garlic", "olive oil", "butter", "sour cream", "milk", "cheese", "eggs", "flour", "sugar", "honey", "soy sauce", "vinegar", "mustard", "mayonnaise", "ketchup", "ground beef", "chicken breasts", "shrimp", "eggplant", "zucchini", "carrots", "bacon"],
  diet: ["vegetarian"],
  allergies: ["peanuts", "gluten"],
  level: "advanced"
}

test_user2 = User.new(test_user2_atttributes)
test_user2_preference = Preference.new(test_user2_preference_attributes)
test_user2_preference.user = test_user2
test_user2.save!
test_user2_preference.save!

# Test recipes

# Recipe 1

test_recipe1_attributes = {
  name: "Spaghetti Bolognese",
  description: "A classic Italian dish that is easy to make and delicious to eat.",
  ingredients: ["spaghetti", "ground beef", "tomatoes", "onions", "garlic", "olive oil", "salt", "pepper", "bacon"],
  appliances: ["oven", "blender", "toaster", "microwave", "hot plate", "frying pan", "knife", "cutting board", "pan", "pot"],
  instructions: ["Put a large saucepan on a medium heat and add 1 tbsp olive oil",
                  "Add 4 finely chopped bacon rashers and fry for 10 mins until golden and crisp.",
                  "Reduce the heat and add the 2 onions, 2 carrots and 2 garlic cloves, all finely chopped, then fry for 10 mins. Stir the veg often until it softens.",
                  "Increase the heat to medium-high, add 500g beef mince and cook stirring for 3-4 mins until the meat is browned all over",
                  "Add 2 tins plum tomatoes, 2 tbsp tomato purée and 125ml red wine, Stir with a wooden spoon, breaking up the plum tomatoes",
                  "Bring to the boil, reduce to a gentle simmer and cover with a lid. Cook for 1 hr, then remove the lid and cook for another 30 mins",
                  "Add the 75g cheese, check the seasoning and stir.",
                  "When the bolognese is nearly finished, cook 400g spaghetti following the pack instructions.",
                  "Drain the spaghetti and either stir into the bolognese sauce, or serve the sauce on top. Serve with more grated parmesan, the remaining basil leaves and crusty bread, if you like."
                ],
  duration: 90,
  difficulty: "intermediate",
  diet: []
}

test_recipe1 = Recipe.new(test_recipe1_attributes)
client = OpenAI::Client.new
    response = client.images.generate(parameters: { prompt: "delicous picture of #{test_recipe1.name}", size: "512x512" })
    url = response.dig("data", 0, "url")
file = URI.open(url)
test_recipe1.photo.attach(io: file, filename: "#{test_recipe1.name}.jpg", content_type: "image/png")
test_recipe1.save!

# Recipe 2

test_recipe2_attributes = {
  name: "Vegetarian Stir Fry",
  description: "A quick and easy vegetarian stir fry that is perfect for a weeknight dinner.",
  ingredients: ["rice", "soy sauce", "vegetables", "onions", "garlic", "olive oil", "salt", "pepper"],
  appliances: ["oven", "blender", "toaster", "microwave", "hot plate", "frying pan", "knife", "cutting board", "pan", "pot"],
  instructions: ["Cook the rice according to the package instructions.",
                  "Heat 2 tbsp olive oil in a large frying pan over medium heat.",
                  "Add 1 chopped onion and 2 minced garlic cloves and cook until soft.",
                  "Add 4 cups of chopped vegetables and cook until tender.",
                  "Add the cooked rice and 1/4 cup soy sauce and stir to combine.",
                  "Season with salt and pepper to taste.",
                  "Serve hot."
                ],
  duration: 30,
  difficulty: "beginner",
  diet: ["vegetarian"]
}

test_recipe2 = Recipe.new(test_recipe2_attributes)
client = OpenAI::Client.new
    response = client.images.generate(parameters: { prompt: "delicous picture of #{test_recipe2.name}", size: "512x512" })
    url2 = response.dig("data", 0, "url")
file2 = URI.open(url2)
test_recipe2.photo.attach(io: file2, filename: "#{test_recipe2.name}.jpg", content_type: "image/png")
test_recipe2.save!

# Recipe 3

test_recipe3_attributes = {
  name: "Peanut Butter Cookies",
  description: "A classic cookie that is perfect for peanut butter lovers.",
  ingredients: ["peanut butter", "sugar", "eggs", "flour", "baking soda", "salt"],
  appliances: ["oven", "blender", "toaster", "microwave", "hot plate", "frying pan", "knife", "cutting board", "pan", "pot"],
  instructions: ["Preheat the oven to 350°F (180°C).",
                  "In a large bowl, mix 1 cup of peanut butter, 1 cup of sugar, 1 egg, 1 cup of flour, 1/2 tsp of baking soda, and a pinch of salt until well combined.",
                  "Roll the dough into balls and place them on a baking sheet lined with parchment paper.",
                  "Press each ball with a fork to create a crisscross pattern.",
                  "Bake for 10-12 minutes or until golden brown.",
                  "Let the cookies cool on the baking sheet for 5 minutes before transferring them to a wire rack to cool completely."
                ],
  duration: 30,
  difficulty: "beginner",
  diet: []
}

test_recipe3 = Recipe.new(test_recipe3_attributes)
client = OpenAI::Client.new
    response = client.images.generate(parameters: { prompt: "delicous picture of #{test_recipe3.name}", size: "512x512" })
    url3 = response.dig("data", 0, "url")
file3 = URI.open(url3)
test_recipe3.photo.attach(io: file3, filename: "#{test_recipe3.name}.jpg", content_type: "image/png")
test_recipe3.save!


puts 'Seeding completed successfully!'

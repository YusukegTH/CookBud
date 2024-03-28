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
  name: "Honey Soy Glazed Salmon",
  description: "An easy and flavorful salmon dish with a sweet and savory glaze, ready in no time for a nutritious meal.",
  ingredients: ["salmon fillets", "soy sauce", "honey", "garlic", "ginger", "olive oil", "green onions", "sesame seeds"],
  appliances: ["frying pan", "bowl", "whisk", "knife", "cutting board"],
  instructions: [
    "In a bowl, whisk together soy sauce, honey, minced garlic, and grated ginger to make the glaze.",
    "Heat olive oil in a pan over medium heat and sear the salmon fillets, skin-side up, until golden.",
    "Flip the salmon, pour the glaze over, and continue cooking while spooning the glaze over the salmon until it's cooked through.",
    "Garnish with sliced green onions and sesame seeds before serving."
  ],
  duration: 30,
  difficulty: "Beginner",
  diet: []
}

test_recipe1 = Recipe.new(test_recipe1_attributes)
file = File.open(Rails.root.join('app', 'assets', 'images', 'Honey Soy Glazed Salmon.jpg'))
test_recipe1.photo.attach(io: file, filename: "#{test_recipe1.name}.jpg", content_type: "image/png")
test_recipe1.save!

# Recipe 2

test_recipe2_attributes = {
  name: "Garlic Butter Shrimp Pasta",
  description: "A simple yet delicious pasta dish featuring succulent shrimp tossed in garlic butter sauce, perfect for a quick dinner.",
  ingredients: ["pasta", "shrimp", "butter", "garlic", "lemon juice", "parsley", "salt", "pepper", "olive oil"],
  appliances: ["pot", "frying pan", "colander", "knife", "cutting board"],
  instructions: [
    "Cook pasta according to package instructions, then drain and set aside.",
    "Heat olive oil in a pan over medium heat and cook shrimp until pink and opaque.",
    "Add minced garlic to the pan and sauté until fragrant.",
    "Stir in butter and lemon juice until the butter melts and the sauce is combined.",
    "Toss the cooked pasta in the garlic butter sauce, season with salt and pepper, and garnish with chopped parsley before serving."
  ],
  duration: 20,
  difficulty: "Beginner",
  diet: []
}

test_recipe2 = Recipe.new(test_recipe2_attributes)
file = File.open(Rails.root.join('app', 'assets', 'images', 'Garlic Butter Shrimp Pasta.jpg'))
test_recipe2.photo.attach(io: file, filename: "#{test_recipe2.name}.jpg", content_type: "image/png")
test_recipe2.save!

# Recipe 3

test_recipe3_attributes = {
  name: "Creamy Mushroom Pasta",
  description: "A rich and creamy pasta dish that's quick and easy to make.",
  ingredients: ["pasta", "mushrooms", "garlic", "heavy cream", "parmesan cheese", "olive oil", "salt", "pepper"],
  appliances: ["pot", "frying pan", "colander", "knife", "cutting board"],
  instructions: [
    "Cook the pasta according to package instructions and drain.",
    "In a frying pan, heat olive oil over medium heat and sauté garlic until fragrant.",
    "Add sliced mushrooms and cook until browned.",
    "Lower the heat and add heavy cream and parmesan cheese, stirring until the sauce thickens.",
    "Combine the sauce with the cooked pasta, season with salt and pepper to taste, and serve."
  ],
  duration: 20,
  difficulty: "Beginner",
  diet: ["vegetarian"]
}

test_recipe3 = Recipe.new(test_recipe3_attributes)
file = File.open(Rails.root.join('app', 'assets', 'images', 'Creamy Mushroom Pasta.jpg'))
test_recipe3.photo.attach(io: file, filename: "#{test_recipe3.name}.jpg", content_type: "image/png")
test_recipe3.save!

test_recipe4_attributes = {
  name: "Classic Tomato Soup",
  description: "A comforting and simple tomato soup perfect for any day.",
  ingredients: ["tomatoes", "onion", "garlic", "vegetable broth", "olive oil", "salt", "pepper", "cream"],
  appliances: ["pot", "blender", "knife", "cutting board"],
  instructions: [
    "Dice the onion and garlic, then sauté in a pot with olive oil until soft.",
    "Add chopped tomatoes and vegetable broth, bring to a boil, then simmer for 20 minutes.",
    "Blend the soup until smooth, return to the pot, and stir in cream.",
    "Season with salt and pepper, then serve hot with a garnish of your choice."
  ],
  duration: 30,
  difficulty: "Beginner",
  diet: ["vegetarian"]
}

test_recipe4 = Recipe.new(test_recipe4_attributes)
file = File.open(Rails.root.join('app', 'assets', 'images', 'Classic Tomato Soup.jpg'))
test_recipe4.photo.attach(io: file, filename: "#{test_recipe4.name}.jpg", content_type: "image/png")
test_recipe4.save!

test_recipe5_attributes = {
  name: "Vegetable Quiche",
  description: "A delicious and easy-to-make quiche packed with vegetables.",
  ingredients: ["eggs", "milk", "flour", "butter", "cheese", "assorted vegetables", "salt", "pepper"],
  appliances: ["oven", "mixing bowl", "whisk", "pie dish", "knife", "cutting board"],
  instructions: [
    "Preheat the oven and prepare the pie crust in a dish.",
    "Whisk together eggs, milk, and flour.",
    "Sauté vegetables until soft, then spread them evenly on the crust.",
    "Pour the egg mixture over the vegetables, top with cheese.",
    "Bake until the egg mixture is set and the top is golden brown.",
    "Let cool slightly before serving."
  ],
  duration: 45,
  difficulty: "Intermediate",
  diet: ["vegetarian"]
}

test_recipe5 = Recipe.new(test_recipe5_attributes)
file = File.open(Rails.root.join('app', 'assets', 'images', 'Vegetable Quiche.jpg'))
test_recipe5.photo.attach(io: file, filename: "#{test_recipe5.name}.jpg", content_type: "image/png")
test_recipe5.save!

test_recipe6_attributes = {
  name: "Spicy Lentil Dahl",
  description: "A hearty and flavorful lentil dish, spiced with traditional Indian flavors.",
  ingredients: ["lentils", "onion", "garlic", "ginger", "turmeric", "cumin", "chili powder", "tomatoes", "vegetable broth", "cilantro"],
  appliances: ["pot", "knife", "cutting board"],
  instructions: [
    "Rinse lentils and set aside.",
    "Sauté onion, garlic, and ginger in a pot until golden.",
    "Add spices and tomatoes, cook for a few minutes.",
    "Add lentils and vegetable broth, simmer until lentils are soft.",
    "Garnish with cilantro and serve with rice or naan."
  ],
  duration: 40,
  difficulty: "Beginner",
  diet: ["vegan"]
}

test_recipe6 = Recipe.new(test_recipe6_attributes)
file = File.open(Rails.root.join('app', 'assets', 'images', 'Spicy Lentil Dahl.jpg'))
test_recipe6.photo.attach(io: file, filename: "#{test_recipe6.name}.jpg", content_type: "image/png")
test_recipe6.save!

test_recipe7_attributes =  {
  name: "Classic Beef Stroganoff",
  description: "A rich and creamy beef stroganoff served over a bed of egg noodles, perfect for a comforting meal.",
  ingredients: ["beef sirloin", "mushrooms", "onion", "garlic", "beef broth", "sour cream", "mustard", "egg noodles", "butter", "flour", "salt", "pepper"],
  appliances: ["pot", "frying pan", "knife", "cutting board"],
  instructions: [
    "Slice beef into thin strips and season with salt and pepper.",
    "Brown beef strips in a frying pan, then set aside.",
    "In the same pan, sauté mushrooms, onion, and garlic.",
    "Stir in flour and slowly add beef broth, creating a thick sauce.",
    "Add mustard and sour cream, stirring until smooth. Return beef to the pan.",
    "Serve the beef mixture over cooked egg noodles."
  ],
  duration: 45,
  difficulty: "Intermediate",
  diet: []
}

test_recipe7 = Recipe.new(test_recipe7_attributes)
file = File.open(Rails.root.join('app', 'assets', 'images', 'Classic Beef Stroganoff.jpg'))
test_recipe7.photo.attach(io: file, filename: "#{test_recipe7.name}.jpg", content_type: "image/png")
test_recipe7.save!

test_recipe8_attributes = {
  name: "Seared Scallops with Herb Butter Sauce",
  description: "Delicate scallops seared to perfection and drizzled with a flavorful herb butter sauce.",
  ingredients: ["scallops", "butter", "garlic", "lemon juice", "parsley", "salt", "pepper", "olive oil"],
  appliances: ["frying pan", "knife", "cutting board"],
  instructions: [
    "Pat scallops dry and season with salt and pepper.",
    "Heat olive oil in a pan over high heat and sear scallops until golden brown on each side.",
    "For the sauce, melt butter in a pan, add garlic, lemon juice, and parsley.",
    "Pour the herb butter sauce over the seared scallops and serve immediately."
  ],
  duration: 30,
  difficulty: "Intermediate",
  diet: []
}

test_recipe8 = Recipe.new(test_recipe8_attributes)
file = File.open(Rails.root.join('app', 'assets', 'images', 'Seared Scallops with Herb Butter Sauce.jpg'))
test_recipe8.photo.attach(io: file, filename: "#{test_recipe8.name}.jpg", content_type: "image/png")
test_recipe8.save!

test_recipe9_attributes = {
  name: "Homemade Spinach and Ricotta Ravioli",
  description: "Fresh homemade ravioli filled with a creamy spinach and ricotta mixture, served with a sage butter sauce.",
  ingredients: ["spinach", "ricotta cheese", "flour", "eggs", "parmesan cheese", "nutmeg", "salt", "pepper", "butter", "sage"],
  appliances: ["mixing bowl", "pot", "frying pan", "pasta machine or rolling pin", "knife", "cutting board"],
  instructions: [
    "Mix flour and eggs to form a dough, knead well and let rest.",
    "Cook spinach, chop finely, and mix with ricotta, parmesan, nutmeg, salt, and pepper.",
    "Roll out pasta dough, place small amounts of filling on the dough, and cover with another layer of dough. Seal edges.",
    "Boil ravioli until they float to the surface, then drain.",
    "For the sauce, melt butter and add sage. Pour over ravioli before serving."
  ],
  duration: 120,
  difficulty: "Advanced",
  diet: []
}

test_recipe9 = Recipe.new(test_recipe9_attributes)
file = File.open(Rails.root.join('app', 'assets', 'images', 'Homemade Spinach and Ricotta Ravioli.jpg'))
test_recipe9.photo.attach(io: file, filename: "#{test_recipe9.name}.jpg", content_type: "image/png")
test_recipe9.save!

test_recipe10_attributes = {
  name: "Coq Au Vin",
  description: "A classic French dish of chicken cooked in red wine with mushrooms, onions, and bacon.",
  ingredients: ["chicken thighs", "bacon", "red wine", "chicken broth", "mushrooms", "pearl onions", "garlic", "thyme", "butter", "flour", "salt", "pepper"],
  appliances: ["oven", "dutch oven or heavy pot", "knife", "cutting board"],
  instructions: [
    "Brown bacon in a pot, then remove. In the same pot, brown chicken thighs.",
    "Add garlic, thyme, mushrooms, and pearl onions to the pot. Cook until onions are soft.",
    "Sprinkle flour over the mixture, then add red wine and chicken broth. Bring to a boil.",
    "Cover and transfer to the oven to bake until the chicken is tender.",
    "Serve the chicken with the sauce and vegetables, garnished with cooked bacon."
  ],
  duration: 150,
  difficulty: "Advanced",
  diet: []
}

test_recipe10 = Recipe.new(test_recipe10_attributes)
file = File.open(Rails.root.join('app', 'assets', 'images', 'Coq Au Vin.jpg'))
test_recipe10.photo.attach(io: file, filename: "#{test_recipe10.name}.jpg", content_type: "image/png")
test_recipe10.save!

puts 'Seeding completed successfully!'

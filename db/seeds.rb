# Destroy all existing records
puts 'Destroying existing records...'
User.destroy_all
Preference.destroy_all
Recipe.destroy_all
Review.destroy_all

appliances = ["stove", "microwave", "hot plate", "oven", "blender", "toaster"]
ingredients = ["tomatoes", "potatoes", "salt", "pepper", "rice", "pasta"]
diet = ["vegetarian", "vegan", "pescatarian", "keto", "paleo", "gluten-free"]
allergies = ["peanuts", "dairy", "gluten", "shellfish", "soy", "eggs", "wheat"]
level = ["beginner", "intermediate", "advanced"]
instructions = ["boil", "fry", "bake", "microwave", "blend", "roast"]


i = 1

3.times do
  user_attributes = {
    email: "email#{i}@example.com",
    password: "password#{i}",
    first_name: "first_name#{i}",
    last_name: "last_name#{i}",
    username: "username#{i}",
  }

  preference_attributes = {
    appliances: appliances.sample(3),
    ingredients: ingredients.sample(3),
    diet: diet.sample(2),
    allergies: allergies.sample(2),
    level: level.sample
  }

  recipe_attributes = {
    name: "recipe#{i}",
    description: "description#{i}",
    ingredients: ingredients.sample(3),
    appliances: appliances.sample(3),
    instructions: instructions.sample(4),
    duration: rand(10..60),
    difficulty: level.sample,
    diet: diet.sample(2)
  }

  review_attributes = {
    rating: rand(1..5),
    comment: "comment#{i}"
  }

  user = User.new(user_attributes)
  preference = Preference.new(preference_attributes)
  preference.user = user
  user.save!
  preference.save!

  recipe = Recipe.new(recipe_attributes)
  recipe.save!
  review = Review.new(review_attributes)
  review.recipe = recipe
  review.user = user
  review.save!

  i += 1
end

puts 'Seeding completed successfully!'

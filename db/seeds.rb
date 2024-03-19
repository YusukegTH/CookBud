# Destroy all existing records
puts 'Destroying existing records...'
User.destroy_all

# Method to create a user with preference, recipes, bookmarks, reviews, and posts
def create_user(email, password, first_name, last_name, username, preference_attrs, recipes_attrs)
  user = User.create!(
    email: email,
    password: password,
    first_name: first_name,
    last_name: last_name,
    username: username
  )
  user.create_preference(preference_attrs)
  recipes_attrs.each do |recipe_attrs|
    user.recipes.create!(recipe_attrs)
  end
  user
end

# Seed data
users_data = [
  {
    email: 'user1@example.com',
    password: 'password1',
    first_name: 'John',
    last_name: 'Doe',
    username: 'john_doe',
    preference_attrs: {
      appliances: 'Stove, Oven',
      inventory: 'Fridge, Pantry',
      diet: 'Vegetarian',
      allergies: 'None',
      level: 'Intermediate'
    },
    recipes_attrs: [
      {
        name: 'Vegetable Stir-Fry',
        description: 'A simple and healthy stir-fry recipe.',
        ingredients: 'Mixed vegetables, soy sauce, oil',
        appliances: 'Stove',
        instructions: '1. Heat oil in a pan...',
        duration: '30 minutes',
        difficulty: 'Easy',
        diet: 'Vegetarian'
      }
    ]
  },
  {
    email: 'user2@example.com',
    password: 'password2',
    first_name: 'Jane',
    last_name: 'Smith',
    username: 'jane_smith',
    preference_attrs: {
      appliances: 'Blender, Microwave',
      inventory: 'Fridge, Freezer',
      diet: 'Vegan',
      allergies: 'Peanuts',
      level: 'Beginner'
    },
    recipes_attrs: [
      {
        name: 'Vegan Smoothie',
        description: 'A delicious and nutritious vegan smoothie.',
        ingredients: 'Banana, spinach, almond milk',
        appliances: 'Blender',
        instructions: '1. Combine all ingredients in a blender...',
        duration: '10 minutes',
        difficulty: 'Easy',
        diet: 'Vegan'
      }
    ]
  }
]

# Create users and associated records
users_data.each do |user_data|
  create_user(
    user_data[:email],
    user_data[:password],
    user_data[:first_name],
    user_data[:last_name],
    user_data[:username],
    user_data[:preference_attrs],
    user_data[:recipes_attrs]
  )
end

puts 'Seeding completed successfully!'

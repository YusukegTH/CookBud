# Destroy all existing records
puts 'Destroying existing records...'
User.destroy_all

appliances = ["stove", "microwave"]

# Method to create a user with preference, recipes, bookmarks, reviews, and posts
def create_user(email, password, first_name, last_name, username, preference_attrs)
  user = User.create!(
    email: email,
    password: password,
    first_name: first_name,
    last_name: last_name,
    username: username
  )
  user_preference = Preference.create!(preference_attrs)
  user.preference = user_preference
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
    }
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
    user_data[:preference_attrs]
  )
end

# create loop i
    # create a preference (Preference.create)
    # create a user (User.new)
    # user.preference = preference
    # user.save
    # create a recipe
    # create a bookmark for this recipe and user
    # create a review for this recipe and user

# Seed data
# users_data = [
#   {
#     email: '

puts 'Seeding completed successfully!'

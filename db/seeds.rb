puts "Cleaning exercises..."

Message.destroy_all
Chat.destroy_all
Exercise.destroy_all
User.destroy_all

puts "Creating exercises..."

User.create!(
  email: "demo@lingocoach.com",
  password: "password",
  password_confirmation: "password"
  first_name: "Demo",
  last_name: "User"
)
Exercise.create!(
  name: "Ordering food (EN)",
  language: "en",
  system_prompt: "You are a friendly English coach. Correct the text and explain the errors.",
  content: "Practice ordering food in a restaurant."
)
Exercise.create!(
  name: "Present yourself in French",
  language: "fr",
  system_prompt: "You are a friendly French coach. Correct the text and explain the errors.",
  content: "Practice introducing yourself in French."
)
puts "Done!"

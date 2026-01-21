puts "Cleaning database..."
Message.destroy_all
Chat.destroy_all
Exercise.destroy_all
User.destroy_all

puts "Creating demo user..."
user = User.create!(
  email: "demo@lingocoach.com",
  password: "password",
  first_name: "Demo",
  last_name: "User"
)

puts "Creating exercises..."
Exercise.create!(
  name: "English – Past tense",
  language: "en",
  content: "Write 4–6 sentences about what you did last weekend.",
  system_prompt: "Focus on verb tense corrections and keep explanations simple."
)

Exercise.create!(
  name: "French – Ordering at a café",
  language: "fr",
  content: "Write what you would say to order a coffee and ask for the price.",
  system_prompt: "Correct politeness and common beginner mistakes."
)

puts "🌱 Seeds done"

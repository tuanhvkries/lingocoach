puts "Cleaning exercises..."
Exercise.destroy_all

puts "Creating exercises..."

Exercise.create!(
  name: "Ordering food (EN)",
  language: "en",
  system_prompt: "You are a friendly English coach.",
  content: "Practice ordering food in a restaurant."
)

Exercise.create!(
  name: "Se présenter (FR)",
  language: "fr",
  system_prompt: "Tu es un coach de français bienveillant.",
  content: "Présente-toi : nom, âge, travail, passions."
)

puts "Done ✅"

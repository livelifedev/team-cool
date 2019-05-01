# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

subjects = Subject.create([
  { name: "Maths" }, 
  { name: "History" },
  { name: "Science" },
  { name: "Geography" },
  { name: "English" },
  { name: "Biology" },
])

documents = []

20.times do
  documents << Document.create(
    title: Faker::Book.title, 
    description: Faker::Quote.matz,
    doc_type: rand(2)
  ).subjects.create(name:Subject.pluck(:name)[rand(6)])
end


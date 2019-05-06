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


admin = User.create(
  first_name: "Admin",
  surname: "Admin",
  username: "Admin",
  email: "admin@admin.com", 
  password: "qwerty69",
  birthday: "1993-04-16",
  school: "Coder Academy",
  gender: 2
)

users = []

20.times do
  users << User.create(
    first_name: Faker::Name.first_name,
    surname: Faker::Name.last_name,
    username: Faker::Name.initials,
    email: Faker::Internet.email, 
    password: "12345678",
    birthday: "1993-04-16",
    school: Faker::University.name,
    gender: rand(2)
  )
end

documents = []

40.times do
  documents << Document.create(
    title: Faker::Book.title, 
    description: Faker::Quote.matz,
    doc_type: rand(2),
    user_id: rand(21)
  ).subject_ids = [rand(1..6)]
end


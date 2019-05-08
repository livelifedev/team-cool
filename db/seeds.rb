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
  gender: 2,
  stripe_transaction: "123",
  admin: true
)

user = User.create(
  first_name: "User",
  surname: "User",
  username: "User",
  email: "user@user.com", 
  password: "qwerty69",
  birthday: "1993-04-16",
  school: "Coder Academy",
  gender: 2,
  stripe_transaction: "321",
  admin: false
)

users = []

20.times do
  users << User.create(
    first_name: Faker::Name.first_name,
    surname: Faker::Name.last_name,
    username: Faker::Team.mascot,
    email: Faker::Internet.email, 
    password: "12345678",
    birthday: "1993-04-16",
    school: Faker::University.name,
    gender: rand(2),
    stripe_transaction: rand(1000).to_s,
    admin: false
  )
end

documents = []

40.times do
  documents << Document.create(
    title: Faker::Book.title, 
    description: Faker::Quote.matz,
    doc_type: rand(2),
    user_id: rand(User.count + 1)
  ).subject_ids = [rand(1..6)]
end

Bookmark.create(
  user_id: rand(User.count + 1),
  document_id: rand(Document.count + 1)
)
# Users
User.create!(name:  "Admin",
             email: "admin@framgia.com",
             password:              "123456",
             password_confirmation: "123456",
             role:     1)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
              email: email,
              password:              password,
              password_confirmation: password,
              role: 0)
end

# Categories
10.times do
  name = Faker::Name.title
  description = Faker::Lorem.sentence
  Category.create!(name: name, description: description)
end

#Words
categories = Category.all
categories.each do |category|
  50.times do |i|
    content = Faker::Lorem.word
    speak_url = Faker::Internet.url
    category.words.create!(content: content + Faker::Number.number(3), speak_url: speak_url)
  end
end

#Answers
words = Word.all
words.each do |word|
  content = Faker::Lorem.word
  boolean = true
  word.answers.create!(content: content, correct: boolean)
end
words.each do |word|
  3.times do
    content = Faker::Lorem.word
    boolean = false
    word.answers.create!(content: content, correct: boolean)
  end
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
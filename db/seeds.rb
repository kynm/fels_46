# Users
User.create!(name:  "Admin",
             email: "admin@framgia.com",
             password:              "123456",
             password_confirmation: "123456",
             role:     1)

# Categories
10.times do
  name = Faker::Name.title
  description = Faker::Lorem.sentence
  Category.create!(name: name, description: description)
end

#Words
categories = Category.all
50.times do
  content = Faker::Lorem.word
  speak_url = Faker::Internet.url
  categories.each { |category| category.words.create!(content: content, speak_url: speak_url) }
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
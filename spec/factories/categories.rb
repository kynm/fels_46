require 'faker'

FactoryGirl.define do
  factory :category do |f|
    f.name {Faker::Name.name}
    f.description {Faker::Lorem.sentence}
  end

  factory :word do |f|
    f.content {Faker::Lorem.word}
    f.speak_url {Faker::Internet.url}
  end
end

require 'faker'

FactoryGirl.define do
  factory :answer do |f|
    f.content {Faker::Lorem.word}
    f.correct {false}
  end

end

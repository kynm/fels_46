class Result < ActiveRecord::Base
  has_one :word
  has_one :lesson
end

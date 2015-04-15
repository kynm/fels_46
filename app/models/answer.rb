class Answer < ActiveRecord::Base
  belongs_to :word
  has_many :results

  accepts_nested_attributes_for :results

  validates :content, presence: true, length: {maximum: 50}

  scope :correct, ->{find_by correct: true}
end

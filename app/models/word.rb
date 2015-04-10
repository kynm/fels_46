class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :results

  accepts_nested_attributes_for :answers, :results
end
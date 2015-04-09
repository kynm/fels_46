class Category < ActiveRecord::Base
  validates :name, uniqueness: true, length: {maximum: 50}, presence: true
  validates :description, presence: true

  has_many :words, dependent: :destroy
  has_many :lessons

  accepts_nested_attributes_for :lessons
end

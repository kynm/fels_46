class Category < ActiveRecord::Base
  validates :name, uniqueness: true, length: {maximum: 50}, presence: true
  validates :description, presence: true

  has_many :words, dependent: :destroy
end

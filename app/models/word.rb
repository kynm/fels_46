class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :results

  accepts_nested_attributes_for :results
  accepts_nested_attributes_for :answers,
                                reject_if: lambda {|a| a[:content].blank?},
                                allow_destroy: true

  validates :content, uniqueness: {scope: [:category_id]}
end

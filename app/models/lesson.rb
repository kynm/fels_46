class Lesson < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{|controller, model| controller.current_user}

  belongs_to :category
  belongs_to :user
  has_many :results

  accepts_nested_attributes_for :results

  before_save :update_number_correct

  def update_number_correct
    number_correct = number_correct
  end

  def number_correct
    results.select{|result| result.answer.correct}.count
  end
end
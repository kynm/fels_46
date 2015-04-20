class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :results

  accepts_nested_attributes_for :results
  accepts_nested_attributes_for :answers,
                                reject_if: lambda {|a| a[:content].blank?},
                                allow_destroy: true

  validates :content, uniqueness: {scope: [:category_id]}

  scope :word_user, -> user {joins(results: :lesson).where(lessons: {user_id: user}).distinct}
  scope :random_word, -> {limit(5).order('RAND()')}
  scope :learned, ->user, category_id {where(id: filter_all(user, category_id)).joins(results: :lesson).where(
                            lessons: {user_id: user}).distinct}

  scope :not_learned, ->user, category_id {where(id: filter_all(user, category_id)).where.not id: learned(user, category_id).map(&:id)}
  scope :filter_all, ->user, category_id {where category_id: category_id if(category_id && category_id.to_i != 0)}
end

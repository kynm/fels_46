class LessonsController < ApplicationController
  before_action :logined_in_user

  def new
    @category = Category.find params[:category_id]
    @lesson = Lesson.new
    @lesson_words = @category.words.random_word
    @lesson_words.each {|word| @lesson.results.build word: word}
  end

  def create
    @category = Category.find params[:category_id]
    @lesson = current_user.lessons.build lesson_params
    @lesson.category = @category
    if @lesson.save
      redirect_to category_lesson_path @lesson.category, @lesson
    else
      redirect_to new_category_lesson_path @lesson.category
    end
  end

  def show
    @lesson = Lesson.find params[:id]
    @results = @lesson.results
  end

  private

  def lesson_params
    params.require(:lesson).permit results_attributes: [:answer_id, :word_id]
  end
end
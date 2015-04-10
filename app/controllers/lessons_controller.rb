class LessonsController < ApplicationController
  def create
    category = Category.find params[:category_id]
    @lesson = current_user.lessons.build category_id: category.id
    if @lesson.save
      words = category.words
      words.sample(20).each do |word|
        result = @lesson.results.build word_id: word.id
        result.save
      end
      redirect_to lesson_path @lesson.id
    else
      flash[:danger] = "Error"
      redirect_to root_url
    end
  end

  def show
    @lesson = Lesson.find params[:id]
    @results = @lesson.results
    @words = Array.new
    @results.each do |result|
      @words.push result.word
    end
  end
end
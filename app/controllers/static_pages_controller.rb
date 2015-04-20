class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @activities = PublicActivity::Activity.order('created_at DESC').limit(20)
      @count = Word.word_user(current_user).count
    end
  end
end

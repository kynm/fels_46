class WordsController < ApplicationController

  before_action :logined_user, only: [:index, :create]

  def index
    @categories = Category.all
    params[:filter] = 'filter_all' if params[:filter].blank?
    @words = Word.send "#{params[:filter]}", *[current_user, params[:category_id]]
  end

  private
  def logined_user
    redirect_to root_path unless logged_in?
  end
end

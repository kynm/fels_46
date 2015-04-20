class WordsController < ApplicationController

  before_action :logined_user, only: [:index, :create]

  def index
    @categories = Category.all
    params[:filter] = 'filter_all' if params[:filter].blank?
    @words = Word.send "#{params[:filter]}", *[current_user, params[:category_id]]
    respond_to do |format|
      format.html
      format.js
      format.pdf do
        pdf = WordPdf.new @words
        send_data pdf.render, filename: 'word_list.pdf', type: 'application/pdf'
      end
    end
  end

  private
  def logined_user
    redirect_to root_path unless logged_in?
  end
end

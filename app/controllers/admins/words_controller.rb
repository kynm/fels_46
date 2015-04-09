class Admins::WordsController < ApplicationController
  before_action :admin_user, except: [:show, :index]

  def new
    @category = Category.find params[:category_id]
    @word = Word.new
  end

  def edit
    @category = Category.find params[:category_id]
    @word = Word.find params[:id]
  end

  def create
    @category = Category.find params[:category_id]
    @word = Word.new word_params
    if @word.save
      redirect_to admins_category_path @category
    else
      render 'new'
    end
  end

  def update
    @category = Category.find params[:category_id]
    @word = Word.find params[:id]
    if @word.update_attributes word_params
      flash[:success] = "Word updated"
      redirect_to admins_category_url @category
    else
      render 'edit'
    end
  end

  def destroy
    word = Word.find params[:id]
    word.destroy
    flash[:success] = "Word #{word.content} deleted"
    redirect_to admins_category_path word.category
  end

  private
  
  def admin_user
    redirect_to root_path unless isadmin?
  end

  def word_params
    params.require(:word).permit :content, :category_id,
                          answers_attributes: [:id, :content, :correct, :_destroy]
  end
end
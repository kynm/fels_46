class CategoriesController < ApplicationController
  before_action :logined_in_user

  def index
    @categories = Category.paginate page: params[:page], per_page: 5
  end
end

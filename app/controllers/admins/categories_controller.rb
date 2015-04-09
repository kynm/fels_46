class Admins::CategoriesController < ApplicationController
  before_action :admin_user

  def index
    @categories = Category.paginate page: params[:page], per_page: 10
  end

  def show
    @category = Category.find params[:id]
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find params[:id]
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Category #{@category.name} created!"
      redirect_to admins_category_path(@category.id)
    else
      render "new"
    end
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      flash[:success] = "Category update"
      redirect_to admins_category_path(@category.id)
    else
      render "edit"
    end
  end

  def destroy
    category = Category.find params[:id]
    flash[:success] = "Category #{category.name} delete"
    category.destroy
    redirect_to admins_categories_path
  end

  private

  def category_params
    params.require(:category).permit :name, :description
  end

  def admin_user
    redirect_to root_path unless isadmin?
  end
end

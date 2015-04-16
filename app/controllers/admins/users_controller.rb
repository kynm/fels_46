class Admins::UsersController < ApplicationController
  before_action :admin_user

  def index
    @users = User.paginate page: params[:page], per_page: 10
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find params[:id]
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Create user success!"
      redirect_to admins_user_path @user
    else
      render "new"
    end
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = "User update"
      redirect_to admins_user_path @user
    else
      render "edit"
    end
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    flash[:success] = "User #{user.name} delete"
    redirect_to admins_users_path
  end

  private

  def admin_user
    redirect_to root_path unless isadmin?
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :role)
  end
end

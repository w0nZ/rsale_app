class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :show, :new, :create, :destroy]
  before_action :set_categories, only: [:new, :create, :index, :show, :edit, :update]
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  private

  def user_params
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      #store_location
      flash[:danger] = "Sorry! Bitte anmelden."
      redirect_to login_url
    end
  end

  def set_categories
    @allCategories = Category.all
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end

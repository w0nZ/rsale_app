class CategoriesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :new, :create, :destroy]
  def show
    @category = Category.find(params[:id])
    @product = Product.all
    @allCategories = Category.all
  end

  def index
    logged_in_user
    @allCategories = Category.all
  end

  def new
    @allCategories = Category.all
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
    @allCategories = Category.all
  end

  def update
    @allCategories = Category.all
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
     flash[:success] = "Erfolgreich! Die Kategorie wurde editiert."
     redirect_to category_path(@category)
    else
     flash[:danger] = "Sorry! Die Kategorie wurde nicht editiert."
     render 'edit'
    end
  end

  def create
    @allCategories = Category.all
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to categories_url
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def logged_in_user
    unless logged_in?
      redirect_to root_path
    end
  end
end

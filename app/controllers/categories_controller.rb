class CategoriesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :new, :create, :destroy]
  before_action :set_categories, only: [:new, :create, :index, :show, :edit, :update]

  def show
    @category = Category.find(params[:id])
    @product = Product.all
  end

  def index
    logged_in_user
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
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

  def set_categories
    @allCategories = Category.all
  end

  def logged_in_user
    unless logged_in?
      redirect_to root_path
    end
  end
end

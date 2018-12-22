class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @product = Product.all
  end

  def index
    @product = Product.all
  end
end

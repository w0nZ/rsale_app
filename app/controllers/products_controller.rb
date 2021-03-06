class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show, :destroy]
  before_action :set_categories, only: [:new, :create, :index, :show, :edit, :update]
  before_action :logged_in_user, only: [:create, :edit, :update, :destroy]

  def new
    @product = Product.new
    @categories = Category.all.map{ |cat| [cat.name, cat.id] }
  end

  def create
    @product = Product.new(product_params)
    if @product.save
     flash[:success] = "Erfolgreich! Produkt erfolgreich angelegt."
     redirect_to product_path(@product)
    else
     render 'new'
    end
  end

  def index
    @product = Product.all
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
     flash[:success] = "Erfolgreich! Das Produkt wurde editiert."
     redirect_to product_path(@product)
    else
     flash[:danger] = "Sorry! Das Produkt wurde nicht editiert."
     render 'edit'
    end
  end

  def destroy
   @product.destroy
   flash[:notice] = "Erfolgreich! Das Produkt wurde entfernt."
   redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :category_id, :picture)
    end

    def set_categories
      @allCategories = Category.all
    end

    def set_product
      @product = Product.find(params[:id])
    end
end

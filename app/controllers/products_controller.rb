class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show, :destroy]
  before_action :logged_in_user, only: [:create, :edit, :update, :destroy]

  def new
    @product = Product.new
    #@categories = Category.all.map{ |cat| [cat.name, cat.id] }
  end

  def create
    @product = Product.new(product_params)
    if @product.save
     flash[:notice] = "Product was successfully created"
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
     flash[:notice] = "Product was updated"
     redirect_to product_path(@product)
    else
     flash[:notice] = "Product was not updated"
     render 'edit'
    end
  end

  def destroy
   @product.destroy
   flash[:notice] = "Product was deleted"
   redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :picture)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end

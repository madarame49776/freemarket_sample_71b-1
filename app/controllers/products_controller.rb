class ProductsController < ApplicationController
  def index
  end

  def new 
    @product = Product.new
    @product.images.new
  end 
  def show
  end

  def create
    @product = Product.new(product_params)
    if params[:product][:images_attributes] && @product.save
      redirect_to root_path
    else
      @product.images.new
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :condition, :brand, :send_price,:ship_day, images_attributes: [:name])
  end

end

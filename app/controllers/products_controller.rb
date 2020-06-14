class ProductsController < ApplicationController
  def index
    @parent = Category.where(ancestry: nil)
  end

  def new 
    @results = Address.where('prefecture_id IN(?)', params[:prefecture_id])
  end

  def show
  end

end

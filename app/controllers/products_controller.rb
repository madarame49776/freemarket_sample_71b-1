class ProductsController < ApplicationController
  def index
  end

  def new 
    @results = Address.where('prefecture_id IN(?)', params[:prefecture_id])
  end

  def show
  end

end

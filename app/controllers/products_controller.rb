class ProductsController < ApplicationController
  def new 
    @results = Address.where('prefecture_id IN(?)', params[:prefecture_id])
  end
end

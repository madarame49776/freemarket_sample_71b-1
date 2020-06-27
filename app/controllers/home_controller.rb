class HomeController < ApplicationController
  def index
    @newProducts = Product.includes(:images).where(status: 0).order("RAND()")
    @parents = Category.where(ancestry: nil)
  end
end

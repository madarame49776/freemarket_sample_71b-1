class HomeController < ApplicationController
  def index
    @newProducts = Product.includes(:images).where(status: 0).order("RAND()")
    @brandProducts = Product.includes(:images).where(status: 0).order("id DESC")
    @parents = Category.where(ancestry: nil)
  end
end

class ProductsController < ApplicationController
  before_action :set_product,    only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:edit, :update]


  def index
  end

  def new 
    @product = Product.new
    @product.images.new
   
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

  def show
  end

  def edit
  end

  def update
   if @product.update(product_params)
    redirect_to root_path
   else
    render :edit
   end
    
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def children_category
    #子要素を探し、値を定義。定義された値をjsonへ送る
    @children_category = Category.where(ancestry: params[:parent_category_id])
    render json:  @children_category
  end

  def grandchildren_category
    #孫要素を探し、値を定義。定義された値をjsonへ送る
    @grandchildren_category = Category.where(ancestry: "#{params[:parent_category_id]}/#{params[:children_category_id]}")
    render json: @grandchildren_category 
  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :condition, :brand, :send_price,:ship_day, images_attributes: [:name, :_destroy, :id])
    .merge(user_id: current_user.id,category_id: params[:product][:category_id],prefecture_id: params[:product][:prefecture_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end


  def set_categories
    #カテゴリーから、親要素を探して定義
    @categories = Category.where(ancestry: nil)
  end
  

end

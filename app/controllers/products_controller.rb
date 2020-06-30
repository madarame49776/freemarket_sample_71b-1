class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]
  before_action :set_category, only: [:new, :create]



  # require メソッドを利用することで、引数に設定した key の 値だけを取得することができます。 
  require 'json'


  def index
    # @parent = Category.where(ancestry: nil)
  end

  def new 
    @product = Product.new
    @product.images.new
    @parent = ["選択してください"]
    #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
      @parent << parent.name
      end
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
  end

 # 親カテゴリーが選択された後に動くアクション
  def children_category
    binding.pry
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

# 子カテゴリーが選択された後に動くアクション
  def grandchildren_category
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
   
  end



  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :condition, :brand, :send_price,:ship_day, images_attributes: [:name, :_destroy, :id])
    .merge(user_id: current_user.id,category_id: params[:product][:category_id],prefecture_id: params[:product][:prefecture_id])
  end

  def set_product
    @product = Product.find(params[:id])
    
  end

  def set_category
    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

end

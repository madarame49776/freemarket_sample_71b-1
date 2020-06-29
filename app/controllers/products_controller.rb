class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

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
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_categories = Category.where(ancestry: params[:parent_category_id])
    render json: @category_categories
  end

# 子カテゴリーが選択された後に動くアクション
  def grandchildren_category
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @grandchildren_categories = Category.where(ancestry: "#{params[:parent_category_id]}/#{params[:children_category_id]}")
    render json: @grandchildren_categories
  end



  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :condition, :brand, :send_price,:ship_day, images_attributes: [:name, :_destroy, :id])
    .merge(user_id: current_user.id,category_id: params[:product][:category_id],prefecture_id: params[:product][:prefecture_id])
  end

  def set_product
    @product = Product.find(patams[:id])
  end
  
  def set_categories
    @categories = Category.where(ancestry: nil)
  end

end

require 'rails_helper'


describe Product do
  describe '#create' do
  
      it "有効です" do
        user     = create(:user)
        category = create(:category)
        product  = build(:product, user_id: user.id, category_id: category.id)
        product.valid?
        expect(product).to be_valid
      end

      it "商品名がない場合登録できない" do
        user     = build(:user)
        product  = build(:product, user_id: user.id, name: "")
        product.valid?
        expect(product.errors[:name]).to include("can't be blank")
      end

      it "商品の説明なしでは登録できない" do
        user     = build(:user)
        product  = build(:product, user_id: user.id, description: "")
        product.valid?
        expect(product.errors[:description ]).to include("can't be blank")
      end

      it "商品の値段なしでは登録できない" do
        user     = build(:user)
        product  = build(:product, user_id: user.id, price: "")
        product.valid?
        expect(product.errors[:price]).to include("can't be blank")
      end

      it "商品の状態なしでは登録できない" do
        user     = build(:user)
        product  = build(:product, user_id: user.id, condition: "")
        product.valid?
        expect(product.errors[:condition]).to include("can't be blank")
      end

      it "商品の状態なしでは登録できない" do
        user     = build(:user)
        product  = build(:product, user_id: user.id, status: "")
        product.valid?
        expect(product.errors[:status]).to include("can't be blank")
      end


      it "発送日なしでは登録できない" do
        user     = build(:user)
        product  = build(:product, user_id: user.id, ship_day: "")
        product.valid?
        expect(product.errors[:ship_day]).to include("can't be blank")
      end

      it "発送料なしでは登録できない" do
        user     = build(:user)
        product  = build(:product, user_id: user.id, send_price: "")
        product.valid?
        expect(product.errors[:send_price]).to include("can't be blank")
      end

      it "都道府県なしでは登録できない" do
        user     = build(:user)
        product  = build(:product, user_id: user.id, prefecture_id: nil)
        product.valid?
        expect(product.errors[:prefecture_id]).to include("can't be blank")
      end

      it "カテゴリーなしでは登録できない" do
        user     = build(:user)
        product  = build(:product, user_id: user.id, category_id: nil)
        product.valid?
        expect(product.errors[:category_id]).to include("can't be blank")
      end


      it "ブランドは任意で登録可能です" do
        user     = create(:user)
        category = create(:category)
        product  = build(:product, user_id: user.id, category_id: category.id)
        product.valid?
        expect(product).to be_valid
      end
    end
  end
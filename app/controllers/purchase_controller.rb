class PurchaseController < ApplicationController

  require 'payjp'

  def index
    card = Card.where(user_id: current_user.id).first
    #顧客IDを取得
    if card.blank?
      redirect_to contller: "card", action: "new"
      #登録された情報がない場合はカード登録のやつに移動
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #カード情報の取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報を取得して、カード情報表示のため代入
      @default_card_infomation = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    # d= Product.find(params[:id])
    # @product_purchaser.update( purchaser_id: current_user.id)
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      :amount => 50000,
      :customer => card.customer_id,
      :currency => 'jpy',
    )
    @product_purchaser= Product.find_by(params[:id])
    @product_purchaser.update( buyer_id: current_user.id)
    redirect_to action: 'done'
  end
end

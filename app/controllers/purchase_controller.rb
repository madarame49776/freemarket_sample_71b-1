class PurchaseController < ApplicationController
  before_action :set_card
  require 'payjp'

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end

  def index
    if @card.blank?
      redirect_to contller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_infomation = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      :amount => 50000,
      :customer => card.customer_id,
      :currency => 'jpy',
    )
    @product_purchaser= Product.find(params[:id])
    @product_purchaser.update( buyer_id: current_user.id)
    redirect_to action: 'done'
  end
end

class Address < ApplicationRecord
  #確認
  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :post_number, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :block
    validates :address
    validates :bulding_name	
  end
end

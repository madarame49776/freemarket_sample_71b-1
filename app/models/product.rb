class Product < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :category, optional: true
  belongs_to :buyer, class_name: "User"
  has_many :images
  has_many :images, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :images, allow_destroy: true

  enum condition:   { brand_new: 0, near_to_unused: 1, no_scrach: 2, slight_scrach: 3, has_scrach: 4, bad_state: 5 }
  enum send_price:  { postage_included: 0, cash_on_delivery: 1 }
  enum ship_day:    { early_day: 0, mid_day: 1, late_day: 2 }

  
  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :condition
    validates :status
    validates :send_price
    validates :ship_day
    validates :prefecture_id
    validates :category_id
  end
end
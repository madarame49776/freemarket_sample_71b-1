class Product < ApplicationRecord
  belongs_to :category
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

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

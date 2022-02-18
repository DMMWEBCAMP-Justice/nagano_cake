class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_one_attached :image

  def get_image_id
    image_id
  end
  
  def with_tax_price
    (price * 1.1).floor
  end
end

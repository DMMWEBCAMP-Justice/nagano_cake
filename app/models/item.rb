class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_one_attached :image
  validates :item_name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :introduction, presence: true




  def with_tax_price
    (price * 1.1).floor
  end



end

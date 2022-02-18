class Order < ApplicationRecord
  belongs_to :end_user
  has_many :order_details, dependent: :destroy
  
  #小計を求めるメソッド？？
  def subtotal
    price * amou
  
end

class Order < ApplicationRecord
  belongs_to :end_user
  has_many :order_details, dependent: :destroy


  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting: 0, paid: 1,making: 2, prepare:3, shipped: 4}


  def subtotal
    price * amount
  end


end


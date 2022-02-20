class Order < ApplicationRecord
  belongs_to :end_user
  has_many :order_details, dependent: :destroy

  def subtotal
    price * amount
  end

end

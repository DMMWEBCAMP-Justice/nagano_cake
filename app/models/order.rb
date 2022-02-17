class Order < ApplicationRecord
  belongs_to :end_user
  has_many :order_details, dependent: :destroy
  
  #enum payment_method: { credit_card: 0, transfer: 1 } 保存されないとデータが持ってくるのに必要か、現状不明。
  
end

class Address < ApplicationRecord
  belongs_to :end_user
  validates :postcode, presence: true,length: { minimum: 7, maximum: 7 }, numericality: {only_integer: true}
  validates :address, presence: true
  validates :name, presence: true

  def address_display
    '〒' + postcode + ' ' + address + ' ' + name
  end
end

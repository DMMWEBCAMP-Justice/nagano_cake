class Address < ApplicationRecord
  belongs_to :end_user
  validates :postcode, presence: true, uniqueness: true, length: { minimum: 7, maximum: 7 }, numericality: {only_integer: true}
  validates :address, presence: true, uniqueness: true
  validates :name, presence: true
end

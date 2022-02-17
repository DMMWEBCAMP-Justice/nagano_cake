class Address < ApplicationRecord
belongs_to :end_user
 def full_address
    '〒' + postcode + ' ' + address + ' ' + name
 end
end

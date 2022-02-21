class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

enum making_status {no_make:0, waiting:1,making:2,finished:3}
end

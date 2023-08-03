class NestedForm < ApplicationRecord
  belongs_to :post
 
  validates :input, presence: true
end

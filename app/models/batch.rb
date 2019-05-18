class Batch < ApplicationRecord
  belongs_to :product
  has_many :purchproditemgst
end

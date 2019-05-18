class Product < ApplicationRecord
  has_many :batches, dependent: :destroy
  has_many :sale, dependent: :destroy
  belongs_to :supplier
  belongs_to :productcategory
  belongs_to :chartaccount
  has_many :purchproditemgst
end

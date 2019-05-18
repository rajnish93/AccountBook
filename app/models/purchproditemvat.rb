class Purchproditemvat < ApplicationRecord
  belongs_to :productpurchasevat,optional: true
  belongs_to :product
end

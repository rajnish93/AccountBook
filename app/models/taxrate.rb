class Taxrate < ApplicationRecord
  belongs_to :chartaccount
  has_many :purchproditemgst
end

class Supplier < ApplicationRecord
  #has_many :product, dependent: :destroy
  belongs_to :company
  belongs_to :chartaccount
  multi_tenant :company
end

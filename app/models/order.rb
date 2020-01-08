class Order < ApplicationRecord
  belongs_to :company
  multi_tenant :company


end

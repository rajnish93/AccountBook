class Department < ApplicationRecord
  has_many :employee, dependent: :destroy
  belongs_to :company
  multi_tenant :company
end

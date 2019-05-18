class Productpurchasevat < ApplicationRecord
  belongs_to :chartaccount
  belongs_to :supplier
  belongs_to :employee
  has_many :purchproditemvats, dependent: :destroy
  accepts_nested_attributes_for :purchproditemvats, allow_destroy: true, reject_if: proc { |att| att['product_id'].blank? }
end

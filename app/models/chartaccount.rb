class Chartaccount < ApplicationRecord
  has_many :supplier, dependent: :destroy
#  has_many :productcategory, dependent: :destroy
#  has_many :product, dependent: :destroy
#  has_many :customer, dependent: :destroy
#  has_many :accountjournal, dependent: :destroy
  belongs_to :accountgroup
end

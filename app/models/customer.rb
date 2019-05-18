class Customer < ApplicationRecord
  has_many :sale, dependent: :destroy
  belongs_to :chartaccount
end

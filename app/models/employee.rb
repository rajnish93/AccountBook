class Employee < ApplicationRecord
  has_many :sale, dependent: :destroy
  belongs_to :department
end

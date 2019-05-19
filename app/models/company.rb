class Company < ApplicationRecord
  has_many :users
  has_many :order
  has_many :department
  has_many :supplier
end

class Accountgroup < ApplicationRecord
  has_many :chartaccount, dependent: :destroy
  #paginates_per 5
end

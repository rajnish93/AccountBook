class Accountjournal < ApplicationRecord
  has_many :sale, dependent: :destroy
  belongs_to :chartaccount

  before_create :set_voucher_number

  def set_voucher_number
    self.voucher_number = Accountjournal.get_next_voucher_number(nil)
  end

  def self.get_next_voucher_number user_id
    ((Accountjournal.with_deleted.maximum("id") || 0) + 1).to_s.rjust(5, "0")
  end
end

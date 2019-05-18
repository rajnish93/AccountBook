class Sale < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  belongs_to :employee
  belongs_to :accountjournal


  before_create :set_invoice_number

  def set_invoice_number
    self.invoice_number = Invoice.get_next_invoice_number(nil)
  end

  def self.get_next_invoice_number
    ((Invoice.with_deleted.maximum("id") || 0) + 1).to_s.rjust(5, "0")
  end
end

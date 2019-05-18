class Productpurchasegst < ApplicationRecord
  after_initialize :init
  after_initialize :generate_invoice_number

  belongs_to :chartaccount
  belongs_to :supplier
  belongs_to :employee
  belongs_to :invoice_series
  has_many :purchproditemgsts, dependent: :destroy
  accepts_nested_attributes_for :purchproditemgsts, allow_destroy: true, reject_if: proc { |att| att['rkpurchprodname'].blank? }

  #validates :series, presence: true
  def init
    begin
      # Set defaults
      unless self.id
        self.invoice_series ||= InvoiceSeries.default
        self.rkgoodsreceived ||= Date.current()
       # self.due_date ||= self.issue_date + Integer(Settings.days_to_due).days
      end
    # Using scope.select also triggers this init method
    # so we have to deal with this exception
    rescue ActiveModel::MissingAttributeError
    end

  end
  def generate_invoice_number
     # wrap in a transaction to prevent race conditions
     Productpurchasegst.transaction do
       if self.rkpurchaseinvoiceno.nil?

         self.rkpurchaseinvoiceno = invoice_series.next_number
       end
      # yield
     end
   end

  # def generate_invoice_number
  #     if self.rkpurchaseinvoiceno.nil? && self.rkpurchaseinvoiceno.chomp("JK")
  #
	#       invoice = ((Productpurchasegst.maximum("rkpurchaseinvoiceno").to_i || 0) + 1).to_s.rjust(7, "JK0")
  #
	#       self.rkpurchaseinvoiceno=invoice
  #
  #     end
  # end

end

class InvoiceSeries < ApplicationRecord

  has_many :productpurchasegsts, :dependent => :restrict_with_error

  validates :rkseriesvalue, presence: true

  # Public: Get a string representation of this object
  #
  # Examples
  #
  #   Series.new(rkseriesname: "Sample Series", rkseriesvalue: "SS").to_s
  #   # => "Sample Series (SS)"
  #
  # Returns a string representation of this object
  def to_s
    return rkseriesvalue if rkseriesname.empty?
    rkseriesname
  end

  def next_number
    invoice = Productpurchasegst.where.not(rkpurchaseinvoiceno: nil).last
    if invoice
      productpurchasegsts.rkpurchaseinvoiceno + 1
    else
      rkfirst_number
    end
  end

  def self.default
    self.where(rkseriesactive: true, rkseriesdefault: true).first
  end

  def self.enabled
    self.where(rkseriesactive: true)
  end

end

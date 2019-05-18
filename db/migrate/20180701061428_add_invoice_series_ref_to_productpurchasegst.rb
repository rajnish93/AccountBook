class AddInvoiceSeriesRefToProductpurchasegst < ActiveRecord::Migration[5.2]
  def change

    add_reference(:productpurchasegsts, :invoice_series,  index: true)
  end
end

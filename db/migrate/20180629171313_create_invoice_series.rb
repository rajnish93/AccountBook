class CreateInvoiceSeries < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_series do |t|
      t.string :rkseriesname
      t.string :rkseriesvalue
      t.boolean :rkseriesactive,    default: true
      t.boolean :rkseriesdefault,   default: false
      t.integer :rkfirst_number,    default: 1

      t.timestamps
    end
  end
end

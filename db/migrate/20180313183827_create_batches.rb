class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.boolean :rkbatchstatus
      t.string :rkbatchno
      t.belongs_to :product, foreign_key: true
      t.integer :rkbatchstock
      t.string :rkbatchpacking
      t.decimal :rkbatchpurchaserate, precision: 9, scale: 2
      t.decimal :rkbatchsalerate, precision: 9, scale: 2
      t.decimal :rkbatchwholesalerate, precision: 9, scale: 2
      t.date :rkbatchexpiry
      t.decimal :rkbatchmrp, precision: 9, scale: 2

      t.timestamps
    end
  end
end

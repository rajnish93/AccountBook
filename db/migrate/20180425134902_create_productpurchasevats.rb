class CreateProductpurchasevats < ActiveRecord::Migration[5.2]
  def change
    create_table :productpurchasevats do |t|
      t.belongs_to :chartaccount, foreign_key: true
      t.belongs_to :supplier, foreign_key: true
      t.belongs_to :employee, foreign_key: true
      t.string :rkpurchaseinvoiceno
      t.date :rkpurchasedate
      t.date :rkpurchaseduedate
      t.string :rktransportname
      t.string :rkpurchasegrno
      t.date :rkgoodsreceived
      t.integer :rkpurchasenocase
      t.integer :rkpurchaseccpercent
      t.decimal :rkpurchasesubtotal, precision: 9, scale: 2
      t.decimal :rkpurchasetotalcc, precision: 9, scale: 2
      t.decimal :rkpurchaseccadded, precision: 9, scale: 2
      t.decimal :rkpurchasediscount, precision: 9, scale: 2
      t.decimal :rkpurchaseshipping, precision: 9, scale: 2
      t.decimal :rkpurchasegrandtotal, precision: 9, scale: 2
      t.string :rkpurchaseinwords
      t.integer :rkpurchaseunittotal
      t.integer :rkpurchasevatpercent

      t.timestamps
    end
  end
end

class CreateProductpurchasegsts < ActiveRecord::Migration[5.2]
  def change
    create_table :productpurchasegsts do |t|
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
      t.decimal :rkpurchasesubtotal, precision: 9, scale: 2
      t.decimal :rkpurchasetotaligst, precision: 9, scale: 2
      t.decimal :rkpurchasetotalcgst, precision: 9, scale: 2
      t.decimal :rkpurchasetotalsgst, precision: 9, scale: 2
      t.decimal :rkpurchasediscount, precision: 9, scale: 2
      t.decimal :rkpurchaseshipping, precision: 9, scale: 2
      t.decimal :rkpurchasegrandtotal, precision: 9, scale: 2
      t.string :rkpurchaseinwords
      t.integer :rkpurchaseunittotal

      t.timestamps
    end
  end
end

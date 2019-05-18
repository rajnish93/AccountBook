class CreatePurchproditemgsts < ActiveRecord::Migration[5.2]
  def change
    create_table :purchproditemgsts do |t|
      t.belongs_to :productpurchasegst, foreign_key: true
      t.string :rkpurchprodname
      t.string :rkpurchprodbatch
      t.string :rkpurchprodhsncode
      t.string :rkpurchproduom
      t.date :rkpurchprodexp
      t.integer :rkpurchprodqty
      t.decimal :rkpurchprodrate, precision: 9, scale: 2
      t.decimal :rkpurchprodigst, precision: 5, scale: 2
      t.decimal :rkpurchprodcgst, precision: 5, scale: 2
      t.decimal :rkpurchprodsgst, precision: 5, scale: 2
      t.decimal :rkpurchprodigstval, precision: 9, scale: 2
      t.decimal :rkpurchprodcgstval, precision: 9, scale: 2
      t.decimal :rkpurchprodsgstval, precision: 9, scale: 2
      t.decimal :rkpurchprodamount, precision: 9, scale: 2

      t.timestamps
    end
  end
end

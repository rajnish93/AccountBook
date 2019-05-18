class CreatePurchproditemvats < ActiveRecord::Migration[5.2]
  def change
    create_table :purchproditemvats do |t|
      t.belongs_to :productpurchasevat, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.string :rkpurchprobatch
      t.string :rkpurchproduom
      t.date :rkpurchprodexp
      t.integer :rkpurchprodqty
      t.integer :rkpurchprodfree
      t.decimal :rkpurchprodrate, precision: 9, scale: 2
      t.decimal :rkpurchprodsubval, precision: 9, scale: 2
      t.decimal :rkpurchprodamount, precision: 9, scale: 2

      t.timestamps
    end
  end
end

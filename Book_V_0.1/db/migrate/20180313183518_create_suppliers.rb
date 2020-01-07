class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.boolean :rksupplierstatus
      t.string :rksuppliername
      t.string :rksuppliertin
      t.string :rksupplierpan
      t.string :rksuppliergstn
      t.string :rksupplierddalic
      t.string :rksupplierphone
      t.text :rksupplieraddress
      t.string :rksuppliercity
      t.string :rksupplierzone
      t.string :rksupplierstate
      t.string :rksupplierzipcode
      t.string :rksuppliercountry
      t.belongs_to :chartaccount, foreign_key: true
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end

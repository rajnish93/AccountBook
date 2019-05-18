class CreateTaxrates < ActiveRecord::Migration[5.2]
  def change
    create_table :taxrates do |t|
      t.belongs_to :chartaccount, foreign_key: true
      t.string :rktaxtype
      t.string :rktaxname
      t.decimal :rktaxpercent, precision: 3, scale: 2

      t.timestamps
    end
  end
end

class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.string :rksaleinvoice
      t.date :rksaledate
      t.date :rksaleduedate
      t.belongs_to :customer, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.belongs_to :employee, foreign_key: true
      t.belongs_to :accountjournal, foreign_key: true

      t.timestamps
    end
    add_index :sales, :rksaleinvoice, unique: true
  end
end

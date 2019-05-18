class CreateAccountjournals < ActiveRecord::Migration[5.2]
  def change
    create_table :accountjournals do |t|
      t.integer :rkvouchercode
      t.belongs_to :chartaccount, foreign_key: true
      t.belongs_to :sale
      t.decimal :rkvoucheramount, precision: 9, scale: 2
      t.text :rkvoucherdescription
      t.datetime :rkvoucherdate

      t.timestamps
    end
    add_index :accountjournals, :rkvouchercode, unique: true
  end
end

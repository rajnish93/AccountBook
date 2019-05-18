class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.boolean :rkactive
      t.integer :rkempcode
      t.string :rkempname
      t.string :rkempgender
      t.belongs_to :department, foreign_key: true
      t.datetime :rkhiredate

      t.timestamps
    end
    add_index :employees, :rkempcode, unique: true
  end
end

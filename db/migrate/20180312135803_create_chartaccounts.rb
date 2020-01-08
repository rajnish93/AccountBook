class CreateChartaccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :chartaccounts do |t|
      t.integer :rkcoacode
      t.string :rkcoaname
      t.belongs_to :accountgroup, foreign_key: true

      t.timestamps
    end
    add_index :chartaccounts, :rkcoacode, unique: true
    add_index :chartaccounts, :rkcoaname, unique: true
  end
end

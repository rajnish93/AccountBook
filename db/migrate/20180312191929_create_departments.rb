class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.boolean :rkactive
      t.integer :rkdeptcode
      t.string :rkdeptname
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
    add_index :departments, :rkdeptcode, unique: true
    add_index :departments, :rkdeptname, unique: true
  end
end

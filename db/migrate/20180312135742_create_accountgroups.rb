class CreateAccountgroups < ActiveRecord::Migration[5.2]
  def change
    create_table :accountgroups do |t|
      t.integer :rkaccountcode
      t.string :rkaccountname
      t.string :rkaccounttype

      t.timestamps
    end
    add_index :accountgroups, :rkaccountcode, unique: true
    add_index :accountgroups, :rkaccountname, unique: true
  end
end

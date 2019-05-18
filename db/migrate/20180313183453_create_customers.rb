class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.boolean :rkcustomerstatus
      t.string :rkcustomername
      t.string :rkcustomertin
      t.string :rkcustomerpan
      t.string :rkcustomergstn
      t.string :rkcustomerddalic
      t.string :rkcustomerphone
      t.text :rkcustomeraddress
      t.string :rkcustomercity
      t.string :rkcustomerzone
      t.string :rkcustomerstate
      t.string :rkcustomerzipcode
      t.string :rkcustomercountry
      t.belongs_to :chartaccount, foreign_key: true

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.text :address
      t.date :delivery_date
      t.text :product_id
      t.string :payment_option
      t.decimal :amount, precision: 9, scale: 2
      t.string :order_status
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.boolean :rkproductstatus
      t.string :rkproductname
      t.text :rkproductdescription
      t.belongs_to :supplier, foreign_key: true
      t.belongs_to :productcategory, foreign_key: true
      t.belongs_to :chartaccount, foreign_key: true

      t.timestamps
    end
  end
end

class CreateProductcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :productcategories do |t|
      t.string :rkproductcategorycode
      t.string :rkproductcategoryname
      t.belongs_to :chartaccount, foreign_key: true

      t.timestamps
    end
    add_index :productcategories, :rkproductcategorycode, unique: true
    add_index :productcategories, :rkproductcategoryname, unique: true
  end
end

class IndexForeignKeysInSettings < ActiveRecord::Migration[5.2]
  def change
    add_index :settings, :thing_id
  end
end

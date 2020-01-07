class AddCompanyToUsers < ActiveRecord::Migration[5.2]
  def change
    #add_reference :users, :company, foreign_key: true, type: :uuid
  end
end

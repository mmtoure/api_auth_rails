class AddPhoneToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :phone, :string, null: true
  end
end

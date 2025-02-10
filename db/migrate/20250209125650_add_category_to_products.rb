class AddCategoryToProducts < ActiveRecord::Migration[8.0]
  def change
    add_reference :products, :categories, null: true, foreign_key: true
  end
end

class AddCategoriesRefToCategoriesExpenses < ActiveRecord::Migration[7.0]
  def change
    add_reference :category_expenses, :categories, null: false, foreign_key: { to_table: 'categories' }
  end
end

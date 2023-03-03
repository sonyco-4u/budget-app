class AddCategoriesRefToCategoriesExpenses < ActiveRecord::Migration[7.0]
  def change
    add_reference :category_expenses, :category, null: false, foreign_key: { to_table: 'categories' }
  end
end

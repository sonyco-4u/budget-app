class CategoryExpenses < ApplicationRecord
  belongs_to :expenses, class_name: 'Expenses', foreign_key: 'expenses_id'
  belongs_to :categories, class_name: 'Categories', foreign_key: 'categories_id'
end
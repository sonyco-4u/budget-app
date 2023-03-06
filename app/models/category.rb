# This class represents a category for expenses in the application.
# It inherits from the ApplicationRecord class which provides a base implementation for all ActiveRecord models.
# It defines a 'belongs_to' association with the 'User' model, using the foreign key 'user_id', to establish a relationship between a category and the user who created it.
# It also defines a 'has_many' association with the 'CategoryExpense' model, and a 'has_many through' association with the 'Expense' model, to establish a many-to-many relationship between categories and expenses.
class Category < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :category_expenses
  has_many :expenses, through: :category_expenses

  has_one_attached :icon

  validates :name, presence: true
end

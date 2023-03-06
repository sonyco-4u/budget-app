# Define a class named Expense that inherits from ApplicationRecord
class Expense < ApplicationRecord
  # Define an association between Expense and User, specifying the class name and foreign key
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  # Define an association between Expense and CategoryExpense
  has_many :category_expenses
  # Define an association between Expense and Category, through CategoryExpense
  has_many :categories, through: :category_expenses

  # Define a one-to-one attachment association between Expense and an icon
  has_one_attached :icon

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
end

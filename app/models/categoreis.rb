class Categories < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :category_expenses, class_name: 'CategoryExpense', foreign_key: 'categories_id'

  has_one_attached :icon
  validates :name, presence: true
end
class Category < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :category_expenses
  has_many :expenses, through: :category_expenses

  has_one_attached :icon
  
  validates :name, presence: true
end
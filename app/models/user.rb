class User < ApplicationRecord
  has_many :categories, class_name: 'Categories', foreign_key: 'user_id'
  has_many :expenses, class_name: 'Expenses', foreign_key: 'user_id'

  validates :name, presence: true
end
class User < ApplicationRecord
  # Include several Devise modules to handle user authentication and authorization
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  # Define a one-to-many association between users and categories
  has_many :categories, class_name: 'Category', foreign_key: 'user_id'
  # Define a one-to-many association between users and expenses
  has_many :expenses, class_name: 'Expense', foreign_key: 'user_id'

  validates :name, presence: true

  def admin?
    role == 'admin'
  end
end

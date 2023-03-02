class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :categories, class_name: 'Categories', foreign_key: 'user_id'
  has_many :expenses, class_name: 'Expenses', foreign_key: 'user_id'

  validates :name, presence: true
end
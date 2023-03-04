class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :categories, class_name: 'Category', foreign_key: 'user_id'
  has_many :expenses, class_name: 'Expense', foreign_key: 'user_id'

  validates :name, presence: true

  def admin?
    role == 'admin'
  end
end

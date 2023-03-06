# This class represents the join model for the many-to-many association between expenses and categories.
# It inherits from the ApplicationRecord class which provides a base implementation for all ActiveRecord models.
# It defines two 'belongs_to' associations: 'expense' and 'category',
#  which establish the many-to-many relationship between expenses and categories.
class CategoryExpense < ApplicationRecord
  belongs_to :expense
  belongs_to :category
end

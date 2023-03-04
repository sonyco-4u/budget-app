class ExpensesController < ApplicationController
  before_action :find_user
  before_action :find_category
  before_action :find_category_expenses

  def index
  end

  private

  def find_user
    @user = current_user
  end

  def find_category
    @category = Category.find_by_id(params[:category_id])
  end

  def find_category_expenses
    @category_expenses = CategoryExpense.where({category_id: params[:category_id]})
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :icon)
  end
end

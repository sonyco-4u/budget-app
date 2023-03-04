class ExpensesController < ApplicationController
  before_action :find_user
  before_action :find_category
  before_action :find_category_expenses

  def index
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = @user
    if @expense.save
      CategoryExpense.create(category_id: @category.id, expense_id: @expense.id)
      redirect_to category_expenses_path(category_id: @category.id), notice: 'Expense created successfully'
    else
      flash.now[:alert] = @expense.errors.full_messages.first if @expense.errors.any?
      render :new, status: 400
    end
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

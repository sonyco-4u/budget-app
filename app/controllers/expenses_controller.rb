class ExpensesController < ApplicationController
  before_action :find_user
  before_action :find_category
  before_action :find_category_expenses

  def index; end

  def show
    @expense = Expense.find(params[:id])
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

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update(expense_params)
      redirect_to category_expense_path(category_id: @category.id, id: @expense.id),
                  notice: 'Expense updated successfully'
    else
      flash.now[:alert] = @expense.errors.full_messages.first if @expense.errors.any?
      render :edit, status: 400
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @category_expenses = CategoryExpense.where(expense_id: @expense.id)
    @category_expenses.each do |category_expense|
      expense_id = category_expense.expense_id
      category_expense.destroy
    end
    if @expense.destroy
      redirect_to category_expenses_path(category_id: @category.id, id: @expense.id),
                  notice: 'Expense deleted successfully'
    else
      flash.now[:alert] = @expense.errors.full_messages.first if @expense.errors.any?
      render :index, status: 400
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
    @category_expenses = CategoryExpense.where({ category_id: params[:category_id] })
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :icon)
  end
end

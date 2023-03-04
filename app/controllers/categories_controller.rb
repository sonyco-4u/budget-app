class CategoriesController < ApplicationController
  before_action :find_user
  before_action :find_category, only: %i[show edit update destroy]

  def index
    @categories = @user.categories.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = @user
    if @category.save
      redirect_to category_path(id: @category.id), notice: 'Category created successfully'
    else
      flash.now[:alert] = @category.errors.full_messages.first if @category.errors.any?
      render :new, status: 400
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to category_path(id: @category.id), notice: 'Category updated successfully'
    else
      flash.now[:alert] = @category.errors.full_messages.first if @category.errors.any?
      render :edit, status: 400
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category_expenses = CategoryExpense.where(category_id: @category.id)
    @category_expenses.each do |category_expense|
      expense_id = category_expense.expense_id
      category_expense.destroy
      expense = Expense.delete(expense_id)
    end
    if @category.destroy
      redirect_to categories_path, notice: 'Categories was deleted successfully'
    else
      flash.now[:alert] = @category.errors.full_messages.first if @category.errors.any?
      render :index, status: 400
    end
  end

  private

  def find_user
    @user = current_user
  end

  def find_category
    @category = Category.find_by_id(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end

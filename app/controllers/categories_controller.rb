# CategoriesController class that handles the management of categories for a user
class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :find_user
  before_action :find_category, only: %i[show edit update destroy]

   # index action that lists all the categories for the current user
  def index
    @categories = @user.categories.all
  end

  def show; end

  # new action that creates a new category
  def new
    @category = Category.new
  end

  # create action that saves a new category to the database
  def create
    @category = Category.new(category_params)
    @category.user = @user
    if @category.save
      redirect_to categories_path, notice: 'Group created successfully'
    else
      flash.now[:alert] = @category.errors.full_messages.first if @category.errors.any?
      render :new, status: 400
    end
  end

  def edit; end

  # update action that updates an existing category
  def update
    if @category.update(category_params)
      redirect_to category_path(id: @category.id), notice: 'Category updated successfully'
    else
      flash.now[:alert] = @category.errors.full_messages.first if @category.errors.any?
      render :edit, status: 400
    end
  end

  # rubocop:disable Lint/UselessAssignment
  def destroy
    if can? :edit, @category
      @category_expenses = CategoryExpense.where(category_id: @category.id)
      @category_expenses.each do |category_expense|
        expense_id = category_expense.expense_id
        category_expense.destroy
        expense = Expense.delete(expense_id)
      end
      if @category.destroy
        redirect_to categories_path, notice: 'Category deleted successfully'
      else
        flash.now[:alert] = @category.errors.full_messages.first if @category.errors.any?
        render :index, status: 400
      end
    else
      flash[:alert] = 'Un Authorized'
      redirect_to categories_path
    end
  end
  # rubocop:enable Lint/UselessAssignment

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

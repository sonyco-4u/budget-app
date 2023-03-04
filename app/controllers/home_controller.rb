class HomeController < ApplicationController
  def index
    redirect_to categories_path if user_signed_in?
  end
end

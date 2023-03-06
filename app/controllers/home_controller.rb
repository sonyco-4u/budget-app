# This controller defines the homepage of the application.
class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  # Renders the homepage for the application
  def index
    redirect_to categories_path if user_signed_in?
  end
end

class HomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	redirect_to books_path if current_user
  end
end

class HomeUsersController < ApplicationController
  def index
  	@home_user = HomeUser.all
  end
end

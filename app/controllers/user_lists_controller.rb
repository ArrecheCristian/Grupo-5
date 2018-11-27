class UserListsController < ApplicationController
  before_action :authenticate_admin!  
  def index
  	@user = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	
  end

end

class UserListsController < ApplicationController
  before_action :authenticated_admin!  
  

  def index
    
  	@user = User.all

    @users = params[:nom] ? @user.where("nombre LIKE ?", "%#{params[:nom]}%"): @user

    @users = params[:ape] != "" ? @users.where("apellido LIKE ?", "%#{params[:ape]}%"): @users

    @users = params[:docu] != "" ? @users.where("dni LIKE ?", params[:docu]): @users

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

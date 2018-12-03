class UserListsController < ApplicationController
  before_action :authenticated_admin!  
  

  def index
    
  	@user = User.all

    @users = params[:nom] ? @user.where("nombre LIKE ?", "%#{params[:nom]}%"): @user

    @users = params[:ape] != "" ? @users.where("apellido LIKE ?", "%#{params[:ape]}%"): @users

    doc = params[:docu].to_i
    @users = doc != 0 ? @users.where("dni = ?", doc): @users

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

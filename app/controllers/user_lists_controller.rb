class UserListsController < ApplicationController
  before_action :authenticated_admin!  
  

  def index
  	@user = User.all

    @usuarios = params[:nom] ? User.all.where("Nombre LIKE ?", "%#{params[:nom]}%") : User.all

    @usuarios = params[:ape] != "" ? @usuarios.where("Apellido LIKE ?", "%#{params[:ape]}%") : @usuarios

    @doc = params[:DNI].to_i
    @usuarios = @doc != 0 ? @usuarios.where("DNI == ?", params[:DNI]): @usuarios

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

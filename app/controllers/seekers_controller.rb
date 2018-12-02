class SeekersController < ApplicationController
	before_action :authenticated_user!

	def show
  		@residence = Residence.find(params[:id])

#  		@busca = @residence.week.find_by(fecha: params[:aux])
 # 		@fecha = :aux

  	end

  	def index
  		@user = User.find(params[:id])
  	end

end
class SeekersController < ApplicationController
	before_action :authenticated_user!

	def show
  		@residence = Residence.find(params[:id])
  	end

  	def index
  		@user = User.find(params[:id])
  	end

end
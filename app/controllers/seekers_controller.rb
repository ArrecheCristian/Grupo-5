class SeekersController < ApplicationController
	before_action :authenticate_user!

	def show
  		@residence = Residence.find(params[:id])
  	end

end
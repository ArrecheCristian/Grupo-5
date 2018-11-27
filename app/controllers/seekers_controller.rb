class SeekersController < ApplicationController
	def show
  		@residence = Residence.find(params[:id])
  	end

end
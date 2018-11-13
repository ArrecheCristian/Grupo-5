class HomeUsersController < ApplicationController


	def index

		@busq = params[:search]

		@residences = Residence.all.where("complejo LIKE ?", "%#{params[:search]}%")
	end


end

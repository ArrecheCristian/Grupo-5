class HomeUsersController < ApplicationController

	def index
		@residences = params[:com] ? Residence.all.where("complejo LIKE ?", "%#{params[:com]}%") : Residence.all

		@residences = params[:loc] != "" ? @residences.where("ubicacion LIKE ?", "%#{params[:loc]}%") : @residences

		@precio = params[:pre].to_f
		@residences = @precio != 0.0 ? @residences.where("(precio >= ?) AND (precio <= ?)", (0.8*@precio).to_i, (1.2*@precio).to_i ): @residences

	end
end

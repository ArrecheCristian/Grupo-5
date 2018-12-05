class HomeUsersController < ApplicationController
	 before_action :authenticated_user!  

	def index
			@residence = Residence.all

			Week.where(estado: "").destroy_all

			#Filtros de búsqueda
			@residences = params[:com] ? Residence.all.where("complejo LIKE ?", "%#{params[:com]}%") : Residence.all

			@residences = params[:loc] != "" ? @residences.where("ubicacion LIKE ?", "%#{params[:loc]}%") : @residences

			@precio = params[:pre].to_f
			@residences = @precio != 0.0 ? @residences.where("(precio >= ?) AND (precio <= ?)", (0.8*@precio).to_i, (1.2*@precio).to_i ): @residences


			#Se filtran las residencias que no están en subasta
			aux = []

			@residences.each do |r|
				if (Auction.where(residence_id: r.id, estado: "ACTIVA").count == 0)
					aux << r
				end
			end
			@residences = @residences - aux


			@residences2 = params[:com2] ? Residence.all.where("complejo LIKE ?", "%#{params[:com2]}%") : Residence.all

			@residences2 = params[:loc2] != "" ? @residences2.where("ubicacion LIKE ?", "%#{params[:loc2]}%") : @residences2

			@precio2 = params[:pre2].to_f
			@residences2 = @precio2 != 0.0 ? @residences2.where("(precio >= ?) AND (precio <= ?)", (0.8*@precio2).to_i, (1.2*@precio2).to_i ): @residences2


	end


	def show
    	@residence = Residence.find(params[:id])

 	end



end

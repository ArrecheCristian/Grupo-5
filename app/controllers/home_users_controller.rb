class HomeUsersController < ApplicationController
	 before_action :authenticated_user!  

	def index
			@residence = Residence.all
			subastas = Residence.all
			hotsales = Residence.all

			#borra todas las semanas que no tienen dueño
			Week.where(estado: "").destroy_all

			#Filtro para quedarme solo con las subastas y Hotsales
			noSubasta = []
			noHotsale = []
			subastas.each do |r|
				if (Auction.where(residence_id: r.id).count == 0)
					noSubasta << r
				end
				if (Hotsale.where(residence_id: r.id).count == 0)
					noHotsale << r
				end
			end
			subastas = subastas - noSubasta
			hotsales = hotsales - noHotsale

			#Armo un array con los id de las residencais que tienen subastas
			auxsub = []
			subastas.each do |s|
				auxsub << s.id
			end

			auxhot = []
			hotsales.each do |h|
				auxhot << h.id
			end

			if (auxsub.length > 0)
				#Genero un número random comprendido entre el tamaño del array
				r = Random.new
				i = r.rand(0...auxsub.length) 		
				#Obtengo el id de la pos random
				id = auxsub[i]

				#Obtengo la residencia con dicho id
				@subastaRandom = Residence.find(id)
			else
				@subastaRandom = nil
			end

			if (auxhot.length > 0)
				#Genero un número random comprendido entre el tamaño del array
				r = Random.new
				i = r.rand(0...auxhot.length) 		
				#Obtengo el id de la pos random
				id = auxhot[i]

				#Obtengo la residencia con dicho id
				@hotsaleRandom = Residence.find(id)
			else
				@hotsaleRandom = nil
			end

	end


	def show
    	@residence = Residence.find(params[:id])

 	end

	def auction_reservation
    	@auction = Auction.find(params[:id])
 	end

end

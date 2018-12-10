class AuctionsController < ApplicationController

	##before_action :authenticated_admin!
	## bien aca los user pueden usar index y sshow NADA MAS, y el resto corresponde a los admin
	## el problema es que los admin tambien tienen que poder usar index y show

	def new
		@auction = Auction.new
		@auction.residence_id = params[:id]
		@auction.estado = "ACTIVA"
	end


	def index

		@auction= Auction.all
			#Filtros de búsqueda
		@resiAuction = params[:com] ? Residence.all.where("complejo LIKE ?", "%#{params[:com]}%") : Residence.all

		@resiAuction = params[:loc] != "" ? @resiAuction.where("ubicacion LIKE ?", "%#{params[:loc]}%") : @resiAuction

		@resiAuction = params[:des] != "" ? @resiAuction.where("descripcion LIKE ?", "%#{params[:des]}%") : @resiAuction

		#Se filtran las residencias que no están en subasta
		aux = []

		@resiAuction.each do |r|
			if (Auction.where(residence_id: r.id).count == 0)
				aux << r
			end
		end

		@resiAuction = @resiAuction - aux

	end


	def show
		@auction = Auction.find(params[:id])

	end


  	def destroy
  		@auction = Auction.find(params[:id])

  			if @auction.estado == "FINALIZADA"
  				@auction.destroy
  				redirect_to auctions_path, notice: "La subasta ha sido eliminada con éxito"
  			else
  				redirect_to auctions_path, alert: "ERROR al eliminar la subasta. Esta sigue ACTIVA"
  			end

  	end


	def create
		@auction = Auction.new(auctions_params)
      	limite1 = Date.today + 6.month
      	ocupada = Week.find_by(residence_id: @auction.residence_id, fecha: @auction.fecha)

      	if (Date.parse(@auction.fecha) > limite1) && (ocupada.blank?) 
			if (@auction.save )
				flash[:notice] = "La residencia ha entrado en subasta con éxito"
				redirect_to residence_path(@auction.residence_id)
			else
				flash[:alert] = "No se ha registrado la subasta. Verifique si la subasta ya está iniciada o intentelo nuevamente."
		    	redirect_to residence_path(@auction.residence_id)
			end
		else
			flash[:alert] = "No se ha registrado la subasta. Verifique si la semana esta en el rango disponible o ya está ocupada."
		    redirect_to residence_path(@auction.residence_id)
		end
	end



    def edit

		@auction = Auction.find(params[:id])

			#borra las pujas de los usuarios que no tienen creditos
			p = User.where(credito:  0)
        	p.each do |nombregenerico|
            	Puja.where(email:  nombregenerico.email, auction_id:  @auction.id).destroy_all
        	end
        	#borra los pedidos de que avise por mail cuando se pase una fecha a subasta
        	List.where(fecha: @auction.fecha, residence_id: @auction.residence_id ).destroy_all


			@auction.update(:estado => "FINALIZADA")

			if (@auction.email == nil) || (@auction.pujas.count == 0)
				@auction.update(:email => "no hubo ganador")
				redirect_to auction_path(@auction), alert: 'La subasta no ha tenido ganador'
			else
				@auction.update(:precioBase => @auction.pujas.first.monto)
	            @auction.update(:email => @auction.pujas.first.email)
				@ganador=User.find_by(email: @auction.email)
				@ganador.update(:credito => @ganador.credito - 1)

				#Crea una semana con los datos para que le figure al usuario
				week = Week.create(residence_id: @auction.residence_id, fecha: @auction.fecha, estado: @auction.email)
				week.send_mail
	 		end
   end

	def update
		@auction = Auction.find(params[:id])

    	if @auction.update(auctions_params)
      		redirect_to auctions_path, notice: 'La subasta ha finalizado con éxito'
      	else
        	render :edit
      	end
	end




	private

  	def auctions_params
    	params.require(:auction).permit(:precioBase,:residence_id,:email,:estado,:fecha)
  	end



end

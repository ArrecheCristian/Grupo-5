class AuctionsController < ApplicationController

	def new
		@auction = Auction.new
		@auction.residence_id = params[:id]
		@auction.estado = "ACTIVA"
	end


	def index

		auction = Auction.all

		#resiAuction = []
		#residence = Residence.all
		#auction.each do |auc|
		#	resiAuction << Residence.find(auc.residence_id)
		#end
		

		@auctions = params[:com] ? Residence.where(Residence.auction).where("complejo LIKE ?", "%#{params[:com]}%") : auction

      	#@auctions = params[:loc] != "" ? @auctions.where("ubicacion LIKE ?", "%#{params[:loc]}%") : @auctions

      	#@auctions = params[:des] != "" ? @auctions.where("descripcion LIKE ?", "%#{params[:des]}%") : @auctions

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
		@auction.save
		if (@auction.save )
			flash[:notice] = "La residencia ha entrado en subasta con éxito"
			redirect_to residence_path(@auction.residence_id)
		else
			flash[:alert] = "No se ha registrado la subasta. Verifique si la subasta ya está iniciada o intentelo nuevamente."
		    redirect_to residence_path(@auction.residence_id)
		end
	end



    def edit
#		@auction = Auction.where(residence_id: params[:id])
		@auction = Auction.find(params[:id])

		if(@auction.estado == "ACTIVA")

			@auction.update(:estado => "FINALIZADA")
		else
			redirect_to auctions_path, alert: 'La subasta ya ha sido finalizada previamente'
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
    	params.require(:auction).permit(:precioBase,:residence_id,:email,:estado)
  	end



end

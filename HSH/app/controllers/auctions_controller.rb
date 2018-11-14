class AuctionsController < ApplicationController

	def new
		@auction = Auction.new
		@auction.residencia_id = params[:id]		
	end


	def index
		@auction = Auction.all

	end


	def show
		@auction = Auction.find(params[:id])
	end


  	def destroy
  		auction = Auction.find(params[:id])

  		if auction.destroy
  			redirect_to auctions_path, notice: "La subasta ha sido eliminada con éxito"
  		else
  			redirect_to auctions_path, notice: "ERROR al eliminar la subasta. Intentelo nuevamente"
  		end

  	end


	def create
		@auction = Auction.new(auctions_params)
		@auction.save
		if (@auction.save )
			flash[:notice] = "La residencia ha entrado en subasta con éxito"
			redirect_to residence_path(@auction.residencia_id)
		else
			flash[:alert] = "No se ha registrado la subasta. Verifique si la subasta ya está iniciada o intentelo nuevamente."
		    redirect_to residence_path(@auction.residencia_id)
		end
	end



    def edit
 		valor = params[:id].to_i
     	@auction = Auction.find(Auction.where(residencia_id: valor).ids)
    end


	def update
		@auctionExistente = Auction.find(params[:id])
		@auctionNuevo = Auction.new(auctions_params)
		if (@auctionExistente.precioBase < @auctionNuevo.precioBase)
			if @auctionExistente.update(auctions_params)
      			flash[:notice] = 'Su puja ha sido registrada con éxito. Nos contactaremos con usted si es la puja ganadora'
         		redirect_to home_user_path(@auctionExistente.residencia_id)
            end
        else
         	flash[:alert] = 'Su puja no ha sido registrada. El monto ingresado es inferior a la puja máxima. Intentelo nuevamente'
         	redirect_to home_user_path(@auctionExistente.residencia_id)
 

	    end
	end




	private
  		
  	def auctions_params
    	params.require(:auction).permit(:precioBase,:residencia_id)
  	end
  	


end

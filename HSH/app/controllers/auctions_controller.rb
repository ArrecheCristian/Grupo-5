class AuctionsController < ApplicationController

	def new
		@auction = Auction.new
		@auction.residence_id = params[:id]
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
			redirect_to residence_path(@auction.residence_id)
		else
			flash[:alert] = "No se ha registrado la subasta. Verifique si la subasta ya está iniciada o intentelo nuevamente."
		    redirect_to residence_path(@auction.residence_id)
		end
	end



    def edit
		@auction = Auction.where(residence_id: params[:id])
	#		@auction = Auction.find(params[:id])
	#		@auction=Auction.all.where(residence_id: params[:id])
 #		valor = params[:id].to_i
#    	@auction = Auction.find(Auction.where(residence_id: valor).ids)
    end


	def update
#		@auctionExistente = Auction.find(params[:id])
#		@auctionNuevo = Auction.new(auctions_params)
#	if (@auctionExistente.precioBase < @auctionNuevo.precioBase)
#			if @auctionExistente.update(auctions_params)
      			flash[:notice] = 'Su puja ha sido registrada con éxito. Nos contactaremos con usted si es la puja ganadora'
         		redirect_to home_user_path(@auctionExistente.residence_id)
#            end
#        else
#         	flash[:alert] = 'Su puja no ha sido registrada. El monto ingresado es inferior a la puja máxima. Intentelo nuevamente'
#         	redirect_to home_user_path(@auctionExistente.residence_id)
#	    end
		if @auction.update(auctions_params)
	 			redirect_to show_auctions_path
 		else
	 			render :edit
 			end
	end




	private

  	def auctions_params
    	params.require(:auction).permit(:precioBase,:residence_id,:email)
  	end



end

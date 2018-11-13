class AuctionsController < ApplicationController

	def new
		@auction = Auction.new
		@auction.residencia_id = params[:id]		
	end


	def create

		@auction = Auction.new(auctions_params)
		@auction.save
		if (@auction.save )
			flash[:notice] = " Ha agregado correctamente la residencia a subasta" 
			redirect_to residence_path(@auction.residencia_id)
		else 
			flash[:alert] = "No se pudo guardar"
		    redirect_to residence_path(@auction.residencia_id)
		end
	end


    def edit
 
    	  @auction = Auction.find(params[:id])
     	
    end


	def update
		@auctionExistente = Auction.find(params[:id])
		@auctionNuevo = Auction.new(auctions_params)
		if (@auctionExistente.precioBase < @auctionNuevo.precioBase)
			if @auctionExistente.update(residence_params)
      			flash[:notice] = 'La puja fue realizada con éxito'
             end
         else
         	flash[:alert] = 'Monto debajo de la ultima puja'
 

	end


private

  def auctions_params
    params.require(:auction).permit(:precioBase,:residencia_id,:email)
  end


end
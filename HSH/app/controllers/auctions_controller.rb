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



private
  def auctions_params
    params.require(:auction).permit(:precioBase,:residencia_id)
  end


end
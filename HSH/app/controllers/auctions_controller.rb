class AuctionsController < ApplicationController
	def new
		@auction = Auction.new
		@auction.residencia_id = params[:id]
		@auction.precioBase = 5


		
	end

	def create

		@auction = Auction.new(auctions_params)
		@auction.save
	end




private

  def auctions_params
    params.require(:auction).permit(:precioBase,:residencia_id)
  end


end
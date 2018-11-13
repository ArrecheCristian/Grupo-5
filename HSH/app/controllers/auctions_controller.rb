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

	def edit
    @auction = Auction.find(params[:id])
  end

  def update
    @auction = Auction.find(params[:id])

    if @auction.update(auctions_params)
      redirect_to auctions_path, notice: 'La subasta fue modificada con éxito'
      else
        render :edit
      end
  end

  def destroy
  	auction = Auction.find(params[:id])

  	if auction.destroy
  		redirect_to auctions_path
  	else
  		redirect_to auctions_path
  	end
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

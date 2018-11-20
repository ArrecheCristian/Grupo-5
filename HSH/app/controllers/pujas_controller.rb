class PujasController < ApplicationController

  def new
    @puja = Puja.new
    @puja.auction_id = params[:id]
  end

  def index
    @puja = Puja.all
  end

  def show
    @puja = Puja.find(params[:id])
  end

  def create
    @puja = Puja.new(puja_params)
    if (@puja.monto > @puja.auction.precioBase)
        @puja.save
        @puja.auction.update(:precioBase => @puja.monto)
        @puja.auction.update(:email => @puja.email)
        redirect_to home_users_path, notice: 'La puja se hizo exitosamente'
      else
        flash[:alert] = "No se ha registrado la puja. El monto es mas bajo que el actual."
          render :new
      end
  end

private
  def puja_params
    params.require(:puja).permit(:monto,:email,:auction_id)
  end

end

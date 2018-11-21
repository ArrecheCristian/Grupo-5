class PujasController < ApplicationController

  def new
    @puja = Puja.new
    @puja.auction_id = params[:id]
    @puja.precioBase_actual = @puja.auction.precioBase

  end

  def index
    @puja = Puja.all
  end

  def show
    @puja = Puja.find(params[:id])
  end

  def create
    @puja = Puja.new(puja_params)
    @puja.save
    
    if @puja.save
      if(@puja.monto > @puja.auction.precioBase)
          @puja.auction.update(:precioBase => @puja.monto)
          @puja.auction.update(:email => @puja.email)
      end
        redirect_to home_users_path, notice: 'La residencia fue creado con éxito'
      else
        render :new
      end

  end

private

  def puja_params
    params.require(:puja).permit(:monto,:email,:auction_id,:precioBase_actual)
  end

end

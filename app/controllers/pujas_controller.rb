class PujasController < ApplicationController
    before_action :authenticated_user!  

  def new
    @puja = Puja.new
    @puja.auction_id = params[:id]
    @puja.precioBase_actual = @puja.auction.precioBase
    @puja.email = current_user.email
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
          redirect_to home_users_path, notice: 'La subasta se ha efectuado con exito'
      end
    else
      flash[:alert] = "ERROR: No ha completado los campos correctamente, o la subasta no supero el monto minimo."
      render :new
    end
  end

  private
    def puja_params
      params.require(:puja).permit(:monto,:email,:auction_id,:precioBase_actual)
    end
end

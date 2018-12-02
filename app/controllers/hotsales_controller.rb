class HotsalesController < ApplicationController
  before_action :authenticated_admin!
  
  def index
    @hotsale = Hotsale.all
  end

  def show
    @hotsale = Hotsale.find(params[:id])
  end

  def new
    @hotsale = Hotsale.new
    @hotsale.residence_id = params[:id]
    @hotsale.estado = "ACTIVO"
  end


  def edit
    @hotsale = Hotsale.find(params[:id])
  end

  def update

  end

  def destroy
    @hotsale = Hotsale.find(params[:id])
  end

  def create
    @hotsale = Hotsale.new(hotsale_params)
    limite1 = Date.today
    limite2 = Date.today + 6.month

    if (Date.parse(@hotsale.fecha) > limite1) && (Date.parse(@hotsale.fecha) < limite2) 
      if @hotsale.save
          redirect_to hotsale_path(@hotsale)
      else
        flash[:alert] = "La semana no esta disponible"
        redirect_to residences_path
      end
    else 
        flash[:alert] = "La semana no esta disponible"
        redirect_to residences_path
    end

#    if @hotsale.save
 #       redirect_to residences_path, notice: 'El Hot-Sale fue creado con éxito'
  #  else
   #    render :new
    #end
  end

private

  def hotsale_params
    params.require(:hotsale).permit(:monto,:estado,:email,:residence_id,:fecha)
  end

end

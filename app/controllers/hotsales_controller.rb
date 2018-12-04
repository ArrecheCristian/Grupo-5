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

    if (@hotsale.email == nil) || (Date.parse(@hotsale.fecha) > Date.today)
       @hotsale.destroy
       redirect_to residences_path, notice: "El Hot-Sale' ha sido eliminado con éxito"
      else
        redirect_to residences_path, alert: "ERROR al eliminar el Hot-Sale. Esta reservado o no ha pasado su fecha limite."
      end

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

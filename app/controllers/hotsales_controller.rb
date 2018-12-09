class HotsalesController < ApplicationController
  
  def index
    @hotsale = Hotsale.all
    #Filtros de búsqueda
    @ResiHotsale = params[:com] ? Residence.all.where("complejo LIKE ?", "%#{params[:com]}%") : Residence.all

    @ResiHotsale = params[:loc] != "" ? @ResiHotsale.where("ubicacion LIKE ?", "%#{params[:loc]}%") : @ResiHotsale

    @ResiHotsale = params[:des] != "" ? @ResiHotsale.where("descripcion LIKE ?", "%#{params[:des]}%") : @ResiHotsale

    #Se filtran las residencias que no están en Hot-sale
    aux = []

    @ResiHotsale.each do |r|
      if (Hotsale.where(residence_id: r.id).count == 0)
        aux << r
      end
    end
    
    @ResiHotsale = @ResiHotsale - aux
  end


  def show
    @residence = Residence.find(params[:id])
  end


  def new
    @hotsale = Hotsale.new
    @hotsale.residence_id = params[:id]
    @hotsale.estado = "ACTIVO"

  end


  def edit
    @hotsale = Hotsale.find(params[:id])
  end

  def destroy
    @hotsale = Hotsale.find(params[:id])
 #   if (@hotsale.email == nil) || (Date.parse(@hotsale.fecha) < Date.today)
    if (@hotsale.email == nil)
      @hotsale.destroy
      redirect_to residences_path, notice: "El Hot-Sale' ha sido eliminado con éxito  1"
    else
      @hotsale.send_mail_delete
      @hotsale.destroy
      redirect_to residences_path, notice: "El Hot-Sale se ha eliminado con exito."

    end
 #     else
 #       redirect_to residences_path, alert: "ERROR al eliminar el Hot-Sale. Esta reservado o no ha pasado su fecha limite."
 #     end
  end

  def reservation
      @hotsale = Hotsale.find(params[:id])
      @hotsale.update(:email => current_user.email)
      @hotsale.send_mail
      @hotsale.update(:estado => "FINALIZADO")
  end


  def create
    
    if (admin_signed_in?)
      @hotsale = Hotsale.new(hotsale_params)
      limite1 = Date.today
      limite2 = Date.today + 6.month
      ocupada = Week.find_by(residence_id: @hotsale.residence_id, fecha: @hotsale.fecha)

      if (Date.parse(@hotsale.fecha) > limite1) && (Date.parse(@hotsale.fecha) < limite2) && (ocupada.blank?) 
        if @hotsale.save
            redirect_to hotsale_path(@hotsale.residence)
        else
          flash[:alert] = "La semana no esta disponible"
          redirect_to residences_path
        end
      else 
          flash[:alert] = "La semana no esta disponible"
          redirect_to residences_path
      end
    
    elsif (user_signed_in?)
      #comprar Hot-sale

    end

  end


  private
    def hotsale_params
      params.require(:hotsale).permit(:monto,:estado,:email,:residence_id,:fecha)
    end

end

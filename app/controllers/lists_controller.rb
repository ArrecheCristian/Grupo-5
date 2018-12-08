class ListsController < ApplicationController
	
  def new 
      @list = List.new
      @list.residence_id = params[:id]
      @list.email = current_user.email
  end

	def show 
  		@list = List.findfind(params[:id])
  end

  def index 
  		@list = List.all
  end

  def destroy
      @cancellation = Cancellation.find(params[:id])

      if @list.destroy
       redirect_to residences_path, notice: "Se ha guardado con exito"
      else
        redirect_to residences_path, alert: "ERROR"
      end

  end

  def create
    @list = List.new(list_params)

    limite1 = Date.today + 6.month
    limite2 = Date.today + 8.month

    if (Date.parse(@list.fecha) > limite1)
      if @list.save
          redirect_to home_users_path,notice: "Se ha guardado con exito"
      end
    else 
        flash[:alert] = "La semana no esta disponible. Debe ser luego de los proximos 6 meses"
        redirect_to home_users_path
    end
  end

private

  def list_params
    params.require(:list).permit(:email,:fecha,:residence_id)
  end

end
class CancellationsController < ApplicationController
	
  def new #user
      @cancellation = Cancellation.new
      @cancellation.complejo = params[:complejo]
      @cancellation.fecha = params[:fecha]
      @cancellation.usuario = params[:usuario]
      @cancellation.descripcion = params[:descripcion]

  end

	def show #admin
  		@cancellation = Cancellation.find(params[:id])
  end

  def index #admin
  		@cancellation = Cancellation.all
  end

  def destroy
      @cancellation = Cancellation.find(params[:id])

      if @cancellation.destroy
       redirect_to residences_path, notice: "La cancelacion ha sido eliminada con éxito"
      else
        redirect_to residences_path, alert: "ERROR al eliminar la cancelacion"
      end

  end

  def create #user
    @cancellation = Cancellation.new(cancellation_params)

    if @cancellation.save
        redirect_to home_users_path, notice: 'La peticion de cancelacion fue creada con éxito'
    else
       render :new
    end
  end

private

  def cancellation_params
    params.require(:cancellation).permit(:complejo,:descripcion,:fecha,:usuario,:motivo)
  end

end
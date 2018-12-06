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
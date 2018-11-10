class ResidencesController < ApplicationController
  def index
    @residence = Residence.all
  end

  def show
  end

  def new
    @residence = Residence.new
  end

  def edit
    #Recibo el id de la pelicula que quiero editar
    @residence = Residence.find(params[:id])
  end

  def update
    #Recibo el parametro de la pelicula a actualizar
    #Se llama al update despues de apretar en el edit
    @residence = Residence.find(params[:id])

    if @residence.update(residence_params)
      redirect_to residences_path, notice: 'La residencia fue modificada con éxito'
      else
        render :edit
      end
  end

  def destroy
  	#Recibo como parametro el id de la residencia a eliminar
  	residence = Residence.find(params[:id])

  	if residence.destroy
  		redirect_to residences_path, notice: "La residencia '#{residence.title}' ha sido eliminada con éxito"
  	else 
  		redirect_to residences_path, notice: "ERROR al eliminar la residencia '#{residence.title}'" 
  	end
  end


  def create
    @residence = Residence.new(residence_params)

    if @residence.save
        redirect_to residences_path, notice: 'La residencia fue creado con éxito'
      else
        render :new
      end
  end

private

  def residence_params
    params.require(:residence).permit(:title,:description,:address,:precio,:person)
  end

end
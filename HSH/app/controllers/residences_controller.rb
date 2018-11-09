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
  end

  def update
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
    @residence = Residence.new(params.require(:residence).permit(:title,:description,:address,:precio,:person))
    
    if @residence.save
        redirect_to residences_path, notice: 'La residencia fue creado con éxito'
      else
        render :new
      end
  end

  #def residence_params
   # params.require(:residence).permit(:title,:description,:address,:precio,:person)
  #end

end

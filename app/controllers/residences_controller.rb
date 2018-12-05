class ResidencesController < ApplicationController
  before_action :authenticated_admin!  
  
  def index
    Week.where(estado: "").destroy_all
    
    @residence = Residence.all
    
    #Filtros de búsqueda
    @residences = params[:com] ? @residence.where("complejo LIKE ?", "%#{params[:com]}%") : @residence

    @residences = params[:loc] != "" ? @residences.where("ubicacion LIKE ?", "%#{params[:loc]}%") : @residences

    @residences = params[:des] != "" ? @residences.where("descripcion LIKE ?", "%#{params[:des]}%") : @residences
  end

  def show
    @auction = Auction.all
    @residence = Residence.find(params[:id])
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
    @residence = Residence.find(params[:id])


    if (@residence.auction == nil) && (@residence.weeks.count == 0) && (@residence.hotsales.count == 0) 
       @residence.destroy
       redirect_to residences_path, notice: "La residencia '#{@residence.complejo}' ha sido eliminada con éxito"
      else
        redirect_to residences_path, alert: "ERROR al eliminar la residencia '#{@residence.complejo}'. La residencia tiene semanas reservadas"
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
    params.require(:residence).permit(:complejo,:descripcion,:ubicacion,:precio,:capacidad,:imagen,:estrellas)
  end

end

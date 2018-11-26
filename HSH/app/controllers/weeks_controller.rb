class WeeksController < ApplicationController
  
  def new
  	@week = Week.new
  	@week.residence_id = params[:id]
  	@week.estado = "DISPONIBLE"
  end

  def index
  
  end

  def show
  	@week = Week.find(params[:id])
  end

  def create
		@week = Week.new(weeks_params)
		@week.save
		if (@week.save )
			flash[:notice] = "La semana se ha reservado"
			redirect_to residences_path
		else
			flash[:alert] = "No se ha registrado la semana."
		    redirect_to residences_path
		end
	end

	private

  	def weeks_params
    	params.require(:week).permit(:estado,:residence_id,:fecha)
  	end

end

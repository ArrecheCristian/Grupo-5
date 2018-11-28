class WeeksController < ApplicationController
  before_action :authenticated_user!, only: [:show , :new, :create]
  before_action :authenticated_admin! , only: [:destroy , :edit  , :index]
  def new
  	@week = Week.new
  	@week.residence_id = params[:id]
 # 	@week.estado = "DISPONIBLE"
  end

  def index
     @week = Week.all
  end

  def destroy
    @week = Week.find(params[:id])

    if  @week.destroy 
      if user_signed_in?     
        redirect_to home_users_path
      else
        redirect_to residences_path
      end
    end
  end

  def show
  	@week = Week.find(params[:id])
  end

  def edit
    @week = Week.find(params[:id])
  end

  def create
    @week = Week.new(weeks_params)
    limite1 = Date.today + 6.month
    limite2 = Date.today + 8.month

    if (Date.parse(@week.fecha) > limite1) && (Date.parse(@week.fecha) < limite2) 
      if @week.save
          flash[:notice] = "Ver la semana"
          redirect_to week_path(@week)
      else
        flash[:alert] = "La semana no esta disponible"
        redirect_to seeker_path(@week.residence)
      end
    else 
        flash[:alert] = "La semana no esta disponible"
        redirect_to seeker_path(@week.residence)
    end

  end

	private

  	def weeks_params
    	params.require(:week).permit(:residence_id,:fecha)
  	end

end

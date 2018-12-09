class WeeksController < ApplicationController
  before_action :authenticated_user!, only: [:show , :new, :create, :update]
  before_action :authenticated_admin! , only: [:edit  , :index]
  def new
  	@week = Week.new
  	@week.residence_id = params[:id]
 # 	@week.estado = current_user.email
    

  end

  def index
      #borra las reservas sin dueño
      Week.where(estado: "").destroy_all

      @week = Week.all
      @hotsale = Hotsale.where(estado: "FINALIZADO")
  end

  def destroy
    @week = Week.find(params[:id])

    if(@week.estado == "")
      @week.destroy
      redirect_to home_users_path
    else
      @week.send_mail_delete
      @week.destroy
      redirect_to residences_path
    end

  end

  def show
  	@week = Week.find(params[:id])
  end

  def edit
    @week = Week.find(params[:id])
  end

  def reservation
    @week = Week.find(params[:id])
  end

  def update
    @week = Week.find(params[:id])

  end

  def create
    @week = Week.new(weeks_params)
    limite1 = Date.today + 6.month
    limite2 = Date.today + 8.month

    if (Date.parse(@week.fecha) > limite1) && (Date.parse(@week.fecha) < limite2) 
      if @week.save
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
    	params.require(:week).permit(:residence_id,:fecha,:estado)
  	end

end

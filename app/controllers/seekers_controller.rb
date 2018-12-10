class SeekersController < ApplicationController
	before_action :authenticated_user!

	def show
  		@residence = Residence.find(params[:id])
  end

  	def index
  		@user = User.find(params[:id])
      
  	end

  	def edit
      if ( current_user.credito > 0 )
        @week = Week.find(params[:id])
  		  @week.update(:estado => current_user.email)
        @week.send_mail
        current_user.update(:credito => current_user.credito - 1)
      else
        flash[:alert] = "ERROR: Usted no posee creditos suficientes."
        redirect_to home_users_path
      end
  	end

end
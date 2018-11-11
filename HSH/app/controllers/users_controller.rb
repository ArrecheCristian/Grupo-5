class UsersController < ApplicationController
	
	def index
		@user = User.all		
	end

	def new
	  @user = User.new
	end

	def create
        @user = User.new(user_params)

		if (@user.Password == '1234' )
			@user.save
			redirect_to residences_path 

		elsif  (@user.Password != '1234' )
			redirect_to new_user_path					
		end
	end

	private
  		def user_params
    		params.require(:user).permit(:Password)
  	end


end



  def create

  	@usuario = Usuario.create(params.require(:usuario).permit(:mail))

  	if @usuario.save
  		redirect_to @usuario
  	else
  		render :new
  	end

  end

  def show
  	@usuario = Usuario.find(params[:id])
  end


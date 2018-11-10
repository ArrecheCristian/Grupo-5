class UsersController < ApplicationController
	
	def new
	  @user = User.new
	end

	def index		
	end

	def create
        @user = User.new(user_params)

		if (@user.Password == '1234' )
			redirect_to root_path 
			@user.save

		elsif  (@user.Password != '1234' )
			redirect_to new_user_path					
		end
	end

	private
  		def user_params
    		params.require(:user).permit(:Password)
  	end


end

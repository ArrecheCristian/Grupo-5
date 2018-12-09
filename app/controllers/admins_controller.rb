class AdminsController < ApplicationController




 	def validations
 

		if (params[:Codigo] == '1234' )
		
			redirect_to new_admin_registration_path

		elsif  (params[:Codigo] != '1234' )
			redirect_to root_path
							
		end
	end



end


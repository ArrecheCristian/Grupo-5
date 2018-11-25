module HomeUsersHelper
	def logged_in_user
      	unless logged_in?
        	flash[:alert] = "Please log in."
       		redirect_to new_session_path
      	end
      end
end

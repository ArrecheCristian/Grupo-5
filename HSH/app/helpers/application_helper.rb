module ApplicationHelper

	## setea el usuario actual
	def log_in(user)
    	session[:user_id] = user.id
	end
	## La primera vez que pregunta el current_user es nil entonces lo busca, si ya lo tene cargado lo devuelve.
	
	def current_user
		
		if ( @current_user.nil?)
  			@current_user = User.find_by(id: session[:user_id])
		else
  			@current_user
		end
  	end
	## verifica que el usuario actual exista, es decir que haya un usuario loggeado

	def logged_in?
    	!current_user.nil?
 	end
 	
 	def log_out
    	session[:user_id] = "99999999999"
    	@current_user = nil
    	current_user
    end
end

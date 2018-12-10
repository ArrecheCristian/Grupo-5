class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters,  if: :devise_controller?
   #incluyo los helpers de code para poder accederlos por ej desde el create de controller codes
  include CodesHelper

## corrobora que al menos haya un admin o un user logueado
  def require_login
    unless user_signed_in? || admin_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path # halts request cycle
    end
  end



	 
  def authenticated_user!
    if user_signed_in?

      authenticate_user!
    else
      redirect_to root_path, :notice => 'Estimado: inicie sesión como usuario para continuar'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

 def authenticated_admin!
    if admin_signed_in?
      authenticate_admin!
    else
      redirect_to root_path, :notice => 'Acceso Restringido para clientes'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end






   def after_sign_in_path_for(resource)
 	   if admin_signed_in?
 	   		residences_path
 	   	elsif user_signed_in?
 	   		root_path
 	   	end
 	   		
	end
	protected

  def configure_permitted_parameters
    added_attrs = [:Nombre, :email, :password, :password_confirmation,:Apellido ,:Nacimiento,:Numero_tarjeta,:Vencimiento_tarjeta,
    	:Banco,:Foto_perfil,:DNI ,:premium]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  protected
def after_sending_reset_password_instructions_path_for(resource_or_scope)
  root_path
end

	 
end

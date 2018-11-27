class ApplicationController < ActionController::Base
	require 'sprocket/railtie'
  before_action :configure_permitted_parameters,  if: :devise_controller?

	 
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path, :notice => 'Por favor , inicie sesión para continuar'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

 def authenticate_admin!
    if admin_signed_in?
      super
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



	 
end

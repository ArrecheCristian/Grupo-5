class Users::SessionsController < Devise::SessionsController
    def create
        auth_options = { :recall => 'users#index', :scope => :user }
    	resource = warden.authenticate!(auth_options)
      end
  end
class Admins::User_Manager_Controller < ApplicationController
 
 def editUSR
 	
 	@user = User.find(params[:id])

 end

class UsersController < ApplicationController
	
	def index

		if (user_signed_in?)
			redirect_to home_users_path					
		else
			@user = User.all
			
			residences = Residence.all

			#Armo un array con los id de las residencias actuales
			aux = []
			residences.each do |r|
				aux << r.id
			end

			if (aux.length > 0)
				#Genero un número random comprendido entre el tamaño del array
				r = Random.new
				i = r.rand(0...aux.length) 		
				#Obtengo el id de la pos random
				id = aux[i]

				#Obtengo la residencia con dicho id
				@residence = Residence.find(id)
			else
				@residence = nil
			end
		end
	end
    def serPremium
    end

	def new
	  @user = User.new
	end


	def update

		 @user= User.find(params[:id])

		    if @user.update(user_params)
		      redirect_to user_list_path, notice: 'El usuario fue modificado con éxito'
		    else
		       render :edit
		     end
		
	end


  private
  	def user_params
    	params.require(:user).permit(:premium,:credito)
  	end

end
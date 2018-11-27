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


	def new
	  @user = User.new
	end

	def create
        @user = User.new(user_params)

		if (@user.Password == '015154' )
			@user.save
			redirect_to residences_path 

		elsif  (@user.Password != '015154' )
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


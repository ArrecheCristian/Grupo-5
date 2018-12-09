class CodesController < ApplicationController





	   def new
     	@code = Code.new
     	
     end


	def create

	    @code = Code.new(code_params)

	    if Code.find_by(pass: @code.pass )
	    	#"logueo la contrasea si es valida"
	      code_in @code
	      redirect_to new_admin_registration_path
	    else
	      flash.now[:danger] = 'Invalid email/password combination'
	      render 'new'
	    end
	end

    def index
    	
    end

private
  		def code_params
    		params.require(:code).permit(:pass)
  	end
end

class Users::RegistrationsController < Devise::RegistrationsController

  def new
     super
   end

   def create
     @user = User.new sign_up_params
     
     difAño = Time.now.year-@user.nacimiento.year
     difMes =  @user.nacimiento.month-Time.now.month
     difDia = @user.nacimiento.day-Time.now.day

     if(difAño>18)
       super
     else 
        if (difAño == 18) 
              if (difMes < 0 )
                    super     
              else
                 if(difMes == 0) 
                    if(difDia <0 )
                      super
                    else
                      flash[:alert] = "Debe ser mayor de 18 años para acceder al sistema."
                      redirect_to root_path 
                    end
                  else
                    flash[:alert] = "Debe ser mayor de 18 años para acceder al sistema."
                    redirect_to root_path
                  end
              end  
        else
              flash[:alert] = "Debe ser mayor de 18 años para acceder al sistema."
              redirect_to root_path
        end
   end
 end


   def edit
     super
   end


    def update
     @user = User.new account_update_params.except("current_password")
     
     difAño = Time.now.year-@user.Nacimiento.year
     difMes =  @user.Nacimiento.month-Time.now.month
     difDia = @user.Nacimiento.day-Time.now.day

      if(difAño>18)
        super
      else 
        if (difAño == 18) 
          if (difMes < 0 )
            super     
          else
            if(difMes == 0) 
              if(difDia <0 )
                super
              else
                flash[:alert] = "Fecha no valida, ¿no eres menor de edad o si ?"
                      redirect_to root_path 
              end
            else
              flash[:alert] = "Fecha no valida, ¿no eres menor de edad o si"
                    redirect_to root_path
            end
          end  
        else
              flash[:alert] = "Fecha no valida, ¿no eres menor de edad o si"
              redirect_to root_path
        end
      end
    end


   def destroy
     super
   end

  
   def cancel
     super
   end

end

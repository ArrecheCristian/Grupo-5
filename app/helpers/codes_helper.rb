module CodesHelper
	

 def code_in(code)
     #arreglo hash
    session[:pass] = code.pass
    
  end

  def current_code
      if @current_code.nil?
      passw = session[:pass]
      @current_code = Code.find_by( pass: passw )
    else
       @current_code
    end
  end

   def code_in?
    !current_code.nil?
  end
end

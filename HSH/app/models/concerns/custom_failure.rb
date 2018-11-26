

## esto maneja la redireccion post sign in , cuando falla te redirecciona al root
class CustomFailure < Devise::FailureApp
  def redirect_url
    root_path
  end
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end
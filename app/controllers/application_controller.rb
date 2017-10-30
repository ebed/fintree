## 
# COntrolador Base con metodos comunes

class ApplicationController < ActionController::Base
  require 'httparty'
  rescue_from Timeout::Error, :with => :rescue_from_timeout

  ##
  # Metodo para recuperar los casos de Timeout, al solo tener
  def rescue_from_timeout(exception)
    flash[:error] = "Problema con el Servicio, intente nuevamente (TIMEOUT)"
    redirect_to root_path
  end
end

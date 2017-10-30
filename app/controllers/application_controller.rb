## 
# COntrolador Base con metodos comunes

class ApplicationController < ActionController::Base
  require 'httparty'
  rescue_from Timeout::Error, :with => :rescue_from_timeout
  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_from_notfound
  ##
  # Metodo para recuperar los casos de Timeout, al solo tener
  def rescue_from_timeout(exception)
    flash[:error] = "Problema con el Servicio, intente nuevamente (TIMEOUT)"
    redirect_to root_path
  end


  ##
  # MEtodo para recuperar el caso de buscar registros no existntes
  
  def rescue_from_notfound
  	flash[:error] = "No existe el registro indicado"
    redirect_to users_path
  end


   
end

class SessionController < ApplicationController
	rescue_from Timeout::Error, :with => :rescue_from_timeout


	def index
		@user = User.new

	end

 	def create
 		imagencodificada=Base64.encode64(session_params[:image_file].read)
 		url_login = "http://"+ENV['HOSTNAME_PORT']+"/rest/login"
 		resp = HTTParty.post(url_login,{body: { "image":"#{imagencodificada}", "email":"#{session_params[:email]}" }})
		if resp.code == 200
			flash[:notice] = "Autenticación Exitosa"
			
		else
			flash[:error] = "Autenticación Fallida"  
		end
		redirect_to root_path  

 	end


 	private
 	def session_params
 		params.require(:user).permit(:email, :image_file)
 	end

 	def rescue_from_timeout(exception)
 		 flash[:error] = "Problema con el Servicio, intente nuevamente (TIMEOUT)"  
    	redirect_to root_path
 	 end

end
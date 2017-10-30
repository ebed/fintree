##
# Controlador que maneja el formulario de login

class SessionController < ApplicationController
	

	##
	# Inicializa INDEX para ser renderizado con variable de Usuario nueva
	def index
		@user = User.new

	end

	##
	# Metodo que recibe la llamada del formulario de login, recibiendo el emal y la imagen que se codifica en BASE64
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
 	##
 	# Strong Params  utilizados para el login
 	def session_params
 		params.require(:user).permit(:email, :image_file)
 	end
 
end
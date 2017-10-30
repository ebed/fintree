## 
# Controlador de Usuarios, encargado del mantenedor
# de estos en el sistema


class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	 
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end
	
	def create

		##
		# Codigo engargado de realizar la decodificacion de la imagen en BASE64 para ser almacenado
		# en base de datos
		imagencodificada = Base64.encode64(params.require(:user)[:image_file].read)
	 	 
		user = User.new(user_params)
		user.image = imagencodificada
		if user.save
			flash[:notice] = "Creacion de usuario Exitosa"
			redirect_to users_path
		else
			flash[:error] = "Creacion de usuario  Fallida"  
			redirect_to new_user_path
		end
	end


	def edit
		@user 
	end

	def update
		##
		# Codigo engargado de realizar la decodificacion de la imagen en BASE64 para ser almacenado
		# en base de datos
		imagencodificada = Base64.encode64(params.require(:user)[:image_file].read)
		if @user.update(image: imagencodificada)
			flash[:notice] = "Actualizacion de usuario Exitosa"
			redirect_to users_path
		else
			flash[:error] = "Actualizacion de usuario  Fallida"  
			redirect_to edit_user_path
		end
	end


	def destroy
		if @user.destroy
			flash[:notice] = "Eliminacion de usuario Exitosa"
			redirect_to users_path
		else 
			flash[:error] = "Eliminacion de usuario  Fallida"  
			redirect_to users_path
		end

	end


	private 
	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email)
	end

 

end
 
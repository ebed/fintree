class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end
	
	def create
		imagencodificada=Base64.encode64(params.require(:user)[:image_file].read)
		 
		user = User.new(user_params)
		user.image = imagencodificada
		if user.save
			redirect_to root_path
		else
			redirect_to new_user_path
		end
	end


	def edit
		@user 
	end

	def update

	end


	def destroy
		@user.destroy
		redirect_to users_path
		

	end


	private 
	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email)
	end

end

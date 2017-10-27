module Rest
  module V1
    class AuthenticationController <  ApplicationController

    	def login
    		render json: { "message":"OK" }
    	end


    	def verify
    		render json: { "message":"OK" }
    	end



    end

  end
end

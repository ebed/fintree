
module Rest
  module V1
    class AuthenticationController <  ApplicationController
        include HTTParty
    	def login
            response = HTTParty.post('http://localhost:3000/rest/verify_user')
            ap response
    		render json: { "message":"OK" }
    	end


    	def verify
    		render json: { "message":"OK" }
    	end



    end

  end
end

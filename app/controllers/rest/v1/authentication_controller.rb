
module Rest
  module V1
    class AuthenticationController <  ApplicationController
      include HTTParty
      def login
        url_verify = "http://localhost:3000/rest/verify_user/#{params[:email]}"
        response = HTTParty.post(url_verify,{body: { "image": "#{params[:image]}" }})
        ap response.code
        ap response["message"]
        ahora =Time.now
        SendEmailJob.set(wait: 20.seconds).perform_later(params[:email], request.user_agent, ahora.to_s, response.code)  

      


        render json: { "message": response["message"] }

      end


      def verify
        usuario = User.where(email: params[:id]+"."+params[:format]).first
        if ImageCompare.cumpleSemejanza(verify_params[:image], usuario.image)
          render json: { "message":"OK" }, status: 200
        else
          render json: { "message":"No Autorizado"}, status: 401
        end
      end


      private
      def verify_params
        params.permit(:image)
      end

    end

  end
end

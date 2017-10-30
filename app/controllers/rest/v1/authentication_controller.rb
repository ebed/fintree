## 
# Clase encargada de proveer la API con servicios REST para autenticar

module Rest
  module V1
    class AuthenticationController <  ApplicationController
      include HTTParty

      ##
      # Servicio de Login expuesto para logear. Se requiere un email y una imagen en BASE64
      def login
        url_verify = ENV['PROTOCOLO_SERVER']+"://"+ENV['HOSTNAME_PORT']+"/rest/verify_user/#{params[:email]}"
        
        response = HTTParty.post(url_verify,{body: { "image": "#{params[:image]}" }})
        
        ahora =Time.now
        SendEmailJob.set(wait: 20.seconds).perform_later(params[:email], request.user_agent, ahora.to_s, response.code)  


        render json: { "message": response["message"] }, status: response.code

      end

      ## 
      # Servicio consumido por Login el que valida que la imagen funcione. Se requiere un email  como ID y una imagen en BASE64
      def verify
        usuario = User.where(email: params[:id]+"."+params[:format]).first
        if usuario.present?
          ap "usuario presente"
          if ImageCompare.cumpleSemejanza(verify_params[:image], usuario.image)
            ap "usuario imagen igual"

            render json: { "message":"OK" }, status: 200
          else
            ap "usuario imagen NO igual"

            render json: { "message":"No Autorizado"}, status: 401
          end
        else
          ap "usuario NO presente"

          render json: { "message":"No Autorizado"}, status: 401
        end
      end


      private
      ##
      # Strong Parameters de imagen 
      def verify_params
        params.permit(:image)
      end

    end

  end
end

## 
# Clase encargada de proveer la API con servicios REST para autenticar

module Rest
  module V1
    class AuthenticationController <  ApplicationController
      include HTTParty

      ##
      # Servicio de Login expuesto para logear. Se requiere un email y una imagen en BASE64
      def login
        token = hashconection
        url_verify = ENV['PROTOCOLO_SERVER']+"://"+ENV['HOSTNAME_PORT']+"/rest/verify_user/#{params[:email]}"
        ap token
        
        response = HTTParty.post(url_verify, body: { "image": "#{params[:image]}" }, headers: { Authorization: "Bearer #{token}"})
        
        ahora =Time.now
        SendEmailJob.set(wait: 20.seconds).perform_later(params[:email], request.user_agent, ahora.to_s, response.code)  


        render json: { "message": response["message"] }, status: response.code

      end

      ## 
      # Servicio consumido por Login el que valida que la imagen funcione. Se requiere un email  como ID y una imagen en BASE64
      def verify
        header = request.headers[:Authorization]
        token = header.split[1] unless header.blank?
        ap token
        if token != hashconection  
          render json: {"message": "ACCESO NO PERMITIDO"}, status: 403
        else
          usuario = User.where(email: params[:id]+"."+params[:format]).first
          if usuario.present?
             if ImageCompare.cumpleSemejanza(verify_params[:image], usuario.image)
             
              render json: { "message":"OK" }, status: 200
            else
              
              render json: { "message":"No Autorizado"}, status: 401
            end
          else
           
            render json: { "message":"No Autorizado"}, status: 401
          end
        end
      end


      private
      ##
      # Strong Parameters de imagen 
      def verify_params
        params.permit(:image)
      end


       def hashconection
        md5 = Digest::MD5.new
        md5.update  serverip
        md5.hexdigest
      end

      

      def serverip
        (Socket.ip_address_list.detect{|intf| intf.ipv4_private? }).ip_address 
      end


    end

  end
end

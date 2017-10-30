##
# Clase encargada de proveer la API con servicios REST para autenticar

module Rest
  module V1
    class AuthenticationController <  ApplicationController
      include HTTParty

      ##
      # Servicio de Login expuesto para logear. Se requiere un email y una imagen en BASE64
      # Se setea en el encabezado un token para usar como llave al servicio 2
      def login
        token = hashconection
        url_verify = ENV['PROTOCOLO_SERVER']+"://"+ENV['HOSTNAME_PORT']+"/rest/verify_user/#{params[:email]}"
        response = HTTParty.post(url_verify, body: { "image": "#{params[:image]}" }, headers: { Authorization: "Bearer #{token}"})
        SendEmailJob.set(wait: 20.seconds).perform_later(params[:email], request.user_agent, Time.now.to_s, response.code)
        render json: { "message": response["message"] }, status: response.code
      end


      ##
      # Servicio consumido por Login el que valida que la imagen funcione. Se requiere un email  como ID y una imagen en BASE64
      # Se asegura que el HASH de la IP donde está alojado el servicio sea equivalente al HASH recibido en el header
      def verify
        if validahash(request.headers[:Authorization])
          usuario = User.where(email: params[:id]+"."+params[:format]).first
          if usuario.present?
            render json: { "message":"OK" }, status: 200 if ImageCompare.cumpleSemejanza(verify_params[:image], usuario.image)
            render json: { "message":"No Autorizado"}, status: 401 unless ImageCompare.cumpleSemejanza(verify_params[:image], usuario.image)
          else
            render json: { "message":"No Autorizado"}, status: 401
          end
        else
          render json: {"message": "ACCESO NO PERMITIDO"}, status: 403
        end
      end


      private
      ##
      # Strong Parameters de imagen
      def verify_params
        params.permit(:image)
      end

      ##
      # Encriptacion de la IP del servidor que servirá como token
      def hashconection
        md5 = Digest::MD5.new
        md5.update  serverip
        md5.hexdigest
      end


      ##
      # Obtencion de la IP del servidor
      def serverip
        (Socket.ip_address_list.detect{|intf| intf.ipv4_private? }).ip_address
      end


      ##
      # Valida token

      def validahash(header)
        token = header.split[1] unless header.blank?
        hashconection == token
      end


    end

  end
end

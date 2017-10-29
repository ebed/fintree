module Rest
  module V1
    class ApiController <  ApplicationController
     # skip_before_action :verify_authenticity_token  
      before_action :cors_preflight_check
      after_action :cors_set_access_control_headers

      #skip_before_action :verify_authenticity_token, only: [:create, :destroy]

      rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found



   #   protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
      def record_not_found
        render :json =>  {:code => 200, :descripcion => self.class.name+" con el id "+params[:id]+" no existe"} # Assuming you have a template named 'record_not_found'
      end




      # For all responses in this controller, return the CORS access control headers.

      def cors_set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, DESTROY'
        headers['Access-Control-Max-Age'] = "1728000"
      end

      # If this is a preflight OPTIONS request, then short-circuit the
      # request, return only the necessary headers and return an empty
      # text/plain.

      def cors_preflight_check
        if request.method == :options
          headers['Access-Control-Allow-Origin'] = '*'
          headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, DESTROY'
          headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
          headers['Access-Control-Max-Age'] = '1728000'
          render :text => '', :content_type => 'text/plain'
        end
      end



    end
  end
end

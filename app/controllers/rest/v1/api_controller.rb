module Rest
  module V1
    class ApiController <  ApplicationController
      ActiveRecord::RecordNotFound, with: :record_not_found

      ##
      # Metodo que maneja el caso de posible elmento no existe 
      def record_not_found
        render :json =>  {:code => 200, :descripcion => self.class.name+" con el id "+params[:id]+" no existe"}  
      end

   

    end
  end
end

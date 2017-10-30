module Rest
  module V1
    class ApiController <  ApplicationController
      ActiveRecord::RecordNotFound, :with => :record_not_found

      ##
      # Metodo que maneja el caso de Registro no existenet
      def record_not_found
        render :json =>  {:code => 200, :descripcion => self.class.name+" con el id "+params[:id]+" no existe"} # Assuming you have a template named 'record_not_found'
      end

   

    end
  end
end

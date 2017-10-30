require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe "Indice de Usuarios" do
 

    it "Renderiza template de Index" do
      get :index
      expect(response).to render_template("index")
    end
  end	
end

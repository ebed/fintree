require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "COntrolador de Usuarios" do


    it "Renderiza template de Index" do
      get :index
      expect(response).to render_template("index")
    end

    it "Encuentra pagina de usuario" do
      user = create(:valid_user)
      get :show, params: {  id: user.id }
      expect(response.status).to eq(200)
    end
  end
end

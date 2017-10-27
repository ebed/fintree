require 'rails_helper'

RSpec.describe Rest::V1::AuthenticationController  do
	describe "POST /rest/login" do
		it "Retorna OK al tener  autenticacion valida"
		it "Retorna No Autorizado al tener  autenticacion invalida"
		it "Retorna No autorizado al suceder algun error"

	end

	describe "POST /rest/verify_user" do
		it "Retorna OK al tener una imagen valida para el email"
		it "Retorna No Autorizado al tener  autenticacion invalida"
		it "Retorna No autorizado al suceder algun error"

	end
  
end

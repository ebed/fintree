require 'rails_helper'

RSpec.describe User, type: :model do
  it "Es valido con atributos validos" do
    expect(create(:valid_user)).to be_valid
  end

  it "Lanza error al ingresar email con formato invalido " do 
 	user = create(:valid_user)
 	user.email = "correoinvalido"
  	expect(user).to_not be_valid
  end
end

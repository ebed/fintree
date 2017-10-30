require 'rails_helper'

RSpec.describe User, type: :model do
  it "Es valido con atributos validos" do
    expect(User.new(email: 'test@test.com', image: 'asdsadsadasd')).to be_valid
  end

end

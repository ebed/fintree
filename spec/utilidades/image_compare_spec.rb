require 'rails_helper'

RSpec.describe ImageCompare do
  it 'Debe devolver falso al ingresar 2 textos distintos 100%' do
    texto1="aaa"
    texto2="bbb"
    expect(ImageCompare.cumpleSemejanza(texto1,texto2)).to be false
  end

  it 'Debe devolver falso al ingresar 2 textos iguales en un 80%' do
    texto1="1234567890"
    texto2="12345678xx"
    expect(ImageCompare.cumpleSemejanza(texto1,texto2)).to be false
  end

  it 'Debe devolver verdaderp al ingresar 2 textos iguales sobre un 90%' do
    texto1="1234567890123"
    texto2="123456789012x"
    expect(ImageCompare.cumpleSemejanza(texto1,texto2)).to be true
  end
  it 'Debe devolver verdaderp al ingresar 2 textos iguales  un 100%' do
    texto1="1234567890123"
    texto2="1234567890123"
    expect(ImageCompare.cumpleSemejanza(texto1,texto2)).to be true
  end

end

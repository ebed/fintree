## 
# Modelo base con la informacion del usuario
# Se obliga la preceensia de los atributos email e image
class User < ApplicationRecord
	validates :email, presence: true
	validates :image, presence: true
end

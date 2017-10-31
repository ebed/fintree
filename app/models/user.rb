## 
# Modelo base con la informacion del usuario
# Se obliga la preceensia de los atributos email e image
class User < ApplicationRecord
	validates :email, presence: true
	validates :image, presence: true
	validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
end

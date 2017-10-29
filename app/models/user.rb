class User < ApplicationRecord
	validates :email, presence: true
	validates :image, presence: true
end

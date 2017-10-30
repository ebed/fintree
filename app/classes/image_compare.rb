##
# Clase con la reponsabilidad de comparar imagenes
# toma los strings con los BASE64, y utilizando la gema TEXT, realiza la comparación
# devolviendo el % de similitud
class ImageCompare

	##
	# Metodo de clase que compara 2 strings y devuelve el procentaje de semejanza
	def self.compara(b64_1, b64_2)
		white = Text::WhiteSimilarity.new

		similaridad = white.similarity(b64_1, b64_2)
		 	
		similaridad*100
	end

	##
	# VErifica si se cumple la semejanza comparandola con variable de entorno 
	def self.cumpleSemejanza(b64_1, b64_2)
		
		self.compara(b64_1, b64_2) > ENV['PORCENTAJE_DIFERENCIA_IMAGEN'].to_i
	end


end

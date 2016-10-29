class AnalizadorLinea
	attr_reader :max_frec_count, :max_frec_palabras, :content, :numero_linea

	def initialize(content, numero_linea)
		@content =  content
		@numero_linea = numero_linea
		@max_frec_palabras = []
		calcular_frecuencia_palabras()
	end

	def calcular_frecuencia_palabras()
		frecuencia = Hash.new(0)
		@content.split.each do |palabra|
			frecuencia[palabra.downcase] += 1
		end

		@max_frec_count = frecuencia.values.max

		frecuencia.each do |key, value|
			if value == @max_frec_count
				@max_frec_palabras.push key
			end
		end
	end
end


class Solution
	attr_reader :analizadores, :max_count_across_lines, :max_count_palabras_across_lines
	
	def initialize()
		@analizadores = []
	end

	def analizar_archivo()
		if File.exist? 'test.txt'
			line_num = 0
			File.foreach('test.txt') do |line|
    		@analizadores.push AnalizadorLinea.new(line, line_num += 1)
  		end
  	end
	end

	def calcular_linea_mayor_frecuencia()
		@max_count_across_lines = 0
		@max_count_palabras_across_lines = []

		@analizadores.each do |analizador|
			if (analizador.max_frec_count > @max_count_across_lines)
				@max_count_across_lines = analizador.max_frec_count
			end
		end

		@analizadores.each do |analizador|
			if (@max_count_across_lines == analizador.max_frec_count)
				@max_count_palabras_across_lines.push(analizador)
			end
		end
	end

	def print_palabras_mayor_frecuencia()
		@max_count_palabras_across_lines.each do |analizador|
			analizador.max_frec_palabras.each do |word|
				puts "\"#{word.upcase}\" aparece en la línea #{analizador.numero_linea}"
			end
		end
	end
end
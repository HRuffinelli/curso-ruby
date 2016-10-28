class Persona
  #Persona debe tener atributos: nombre y apellido y deben ser accesibles
  #Persona debe almacenar todas sus instancias para poder hacer seguimiento
  attr_accessor :nombre, :apellido
  @@personas = []

  #Inicializador de instancias
  def initialize(x,y)#Debe recibir dos parametros: nombre y apellido
    @nombre = x
    @apellido = y
    @@personas.push self
  end

  #La clase debe tener tener un search por apellido
  def self.search(apellido)
    @@personas.select { |persona| persona.apellido == apellido }
  end

  def self.buscar(apellido)
    @@personas.each do |persona| 
      if (persona.apellido == apellido)
        puts "#{persona.nombre} #{persona.apellido}"
      end
    end
  end

  #Tener un método que retorne el nombre y el apellido de la persona.
  def to_s
    "Nombre: #{nombre} - Apellido: #{apellido}"
  end

  def funcion(algo)
    puts "#{algo} fue lo que enviaste"
  end
end

#Esto es lo que va a hacer el rspec comentar para correr
p1 = Persona.new("Juan", "Perez")
p2 = Persona.new("Juan", "Benitez")
p3 = Persona.new("Ermenindo", "Perez")
p4 = Persona.new("Romina", "Benitez")

# puts Persona.search("Perez")
Persona.buscar("Perez")

# p1.funcion("Fulano")
# p1.search("Perez")

# Debería imprimir
# => Juan Perez
# => Juana Perezd

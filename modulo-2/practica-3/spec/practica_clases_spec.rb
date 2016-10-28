require 'rspec'
require 'rspec/its'
require_relative '../practica_clases.rb'

describe "Clases" do

  context "check results" do
    p1 = Persona.new("Juan", "Perez")
    p2 = Persona.new("Juan", "Benitez")
    p3 = Persona.new("Juana", "Perez")
    p4 = Persona.new("Romina", "Benitez")

    it "resultado de busqueda inesperado" do
      expect(Persona.search("Perez").size).to be == 2
    end
  end

  context "verificando propiedades de instancia" do
    subject(:john) { Persona.new("Cristian", "Rodriguez") }

    it "missing nombre" do
      is_expected.to respond_to(:nombre)
    end

    it "missing apellido" do
      is_expected.to respond_to(:apellido)
    end

  end

  context "verificando propiedades de clase" do
    subject(:class) { Persona }

    it "missing search" do
      player1 = Player.new("Bob", 13, 5)
      player2 = Player.new("Jim", 15, 4.5)
      player3 = Player.new("Mike", 21, 5)
      player4 = Player.new("Joe", 14, 5)
      player5 = Player.new("Scott", 16, 3)

      red_team = Team.new("Red")
      red_team.add_players(player1, player2, player3, player4, player5)
      elig_players = red_team.select { |player| player.age.between?(14, 20) and player.skill_level >= 4.5 }
      expect(elig_players.size).to be == 3
    end
  end
end

require 'rspec'
require 'rspec/its'
require_relative '../team_players.rb'

describe "Players" do
  context "verificando propiedades de instancia" do
  	subject(:player) { Player.new("Edu", 15, 4) }
	it "missing name" do
	  is_expected.to respond_to(:name)
	end

	it "missing age" do
	  is_expected.to respond_to(:age)
	end

	it "missing skill_level" do
	  is_expected.to respond_to(:skill_level)
	end
  end

  context "check results" do
	subject(:team) { Team.new("Grupo") }
	it "agrega uno o mas jugadores" do
	  is_expected.to respond_to(:add_players).with_unlimited_arguments
	end

	it "resultado sea mayor a 2" do
      player1 = Player.new("Bob", 13, 5)
      player2 = Player.new("Jim", 15, 4.5)
      player3 = Player.new("Mike", 21, 5)
      player4 = Player.new("Joe", 14, 5)
      player5 = Player.new("Scott", 16, 3)

      red_team = Team.new("Red")
      red_team.add_players(player1, player2, player3, player4, player5)
      elig_players = red_team.select { |player| player.age.between?(14, 20) and player.skill_level >= 4.5 }
      expect(elig_players.size).to be == 2
	end
  end
end
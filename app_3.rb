#app.rb

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
player1 = Player.new("José")
player2 = Player.new("Josianne")

def deco
  puts "//" * 50
end

def bot_maker
  bots=[]
  10.times do
  random_number= rand(1..999)
  random_name = "player#{random_number}"
  random_name = Player.new(random_name)
  bots<<random_name
  end
  puts bots[1].name
  return bots
end
def game2
  bots=[]
  deco
  puts " objectif : survivre"
  deco
  puts " Quel est votre nom ?"
  print ">"
  player_name = gets.chomp
  human = HumanPlayer.new(player_name)
  bot_maker
  battle_phase_player(human,bots)
end

def battle_phase_player(human,bots)
  bots=[]
  10.times do
    random_number= rand(1..20)
    random_name = "player#{random_number}"
    random_name = Player.new(random_name)
    bots<<random_name
  end
  nb = rand(1..10)
  nb.times do
  while human.life_points >0
    deco
    puts "Stats    PV: #{human.life_points}       Niv.arme: #{human.weapon_level}"
    puts "Que faire ? a-chercher arme |b-chercher soin"
    nb.times do |i|
      print "#{i}. Attaquer #{bots[i].name} #{bots[i].life_points}.PV | "
      end
    puts ""
    print ">"
    player_choice = "none"
    while player_choice!=4
      player_choice=gets.chomp
      if player_choice == "a"
        human.search_weapon
        break
      end
      if player_choice == "b"
        human.search_health_pack
        break
      end
      nb.times do |i|
        if player_choice.to_i == i
          human.attacks(bots[i])
      end
      end
      break
end
  end
end
end
game2

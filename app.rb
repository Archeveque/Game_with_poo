#app.rb

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("José")
player2 = Player.new("Josianne")

def battle_intro(player1,player2)
  puts "combattant 1 : #{player1.name}        combattant 2 : #{player2.name}"
  deco
  sleep(0.5)
  puts "Heaven"
  sleep(0.5)
  puts "      or"
  sleep(0.5)
  puts "         hell"
  sleep(0.5)
  puts "              LETS ROCK !!!"
end

def battle_phase(player1,player2)
  while player1.life_points >= 1 && player2.life_points >= 1  do
    sleep(0.5)
    deco
    puts "DEBUT PHASE DE COMBAT"
    deco
    sleep(0.5)
    player2.attacks(player1)
    if player1.life_points >= 1 && player2.life_points >= 1 
      sleep(0.5)
      puts "CONTRE-ATTAQUE!!!"
      sleep(0.5)
      player1.attacks(player2)
    end
  end
end

def deco
  puts "//" * 50
end

def game1(player1,player2)
    deco
    battle_intro(player1,player2)
    battle_phase(player1,player2)
end

def game2(player1,player2)
  bots=[]
  bots<<player1
  bots << player2
  deco
  puts " objectif : survivre"
  deco
  puts " Quel est votre nom ?"
  print ">"
  player_name = gets.chomp
  human = HumanPlayer.new(player_name)
  battle_phase_player(player1,player2,human,bots)
end

def battle_phase_player(player1,player2,human,bots)
  while human.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    deco
    puts "Stats    PV: #{human.life_points}       Niv.arme: #{human.weapon_level}"
    puts "Que faire ? a-chercher arme |b-chercher soin |0. attaquer #{player1.name} PV restants: #{player1.life_points}|1. attaquer #{player2.name} PV restants: #{player2.life_points}|4. Fuir"
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
      if player_choice == "0"
        puts " input =0"
        human.attacks(player1)
        break
      end
      if player_choice == "1"
        puts " input =1"
        human.attacks(player2)
        end
        break
      end    
      bots.each do |player|
        if player.life_points >0
          player.attacks(human)
          puts "while2"
        end
      end
  end
  deco
  if human.life_points > 0
    puts "BRAVO TU AS GAGNER UN JEU TRES FACILE"
  else
    puts "Bravo... je suppose.... tu as reussis a perdre un jeu extremement facile..."
  end
  deco
  puts "Fin de partie"
end
def menu(player1,player2)
  puts "Quel est votre choix ?"
  puts "1. 1v1 classique"
  puts "2. Jeu jouable"
  print ">"
  user_choice = gets.chomp.to_i
  puts user_choice
  if user_choice == 1
    puts "choose1"
    game1(player1,player2)
  else
  if user_choice == 2
    puts " choose 2"
    game2(player1,player2)
  else
    puts "wrong choice"
  end
end
end

menu(player1,player2)
binding.pry

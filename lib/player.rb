#player


class Player
  attr_accessor :name, :life_points, :damage
  @@all_players = []

  def initialize(name)
    @name = name
    @life_points = 10
    #@life_points = life_points
    @@all_players << self
  end

  def self.all
    @@all_players
  end

  def show_state
    puts "#{@name} a #{@life_points} PV restants"
  end

  def attacks(name)
    @name_target = name
    damage = compute_damage
    if damage == 0
      puts "#{@name} rate sa cible et inflige aucun dégats a  #{name.name}!"
    end
    if damage == 1
      puts "#{@name} effleure #{name.name} et inflige 1  dégat "
    end
    if damage == 2
      puts "#{@name} met un pôtit coup de pied a #{name.name} et lui inflige 2 dégats"
    end 
    if damage == 3
      puts "#{@name} met un coup de pied dans la jambe de #{name.name} lui infligeant 3 dégats"
    end   
    if damage == 4
      puts "#{@name} met un coup de poing dans l'épaule de #{name.name} lui infligeant 4 dégats!"
    end     
    if damage == 5
      puts "#{@name} met une puissante patate de forain à #{name.name} lui infligeant 5 dégats!!"
    end            
    if damage == 6
      puts "#{@name} met un giga upercut a #{name.name} l'envoyant valser dans les airs et infligeant 6 dégats !!!"
    end
    sleep(1)
    name.gets_damage(damage)
    sleep(1)
  end

  def compute_damage
    return rand(0..6)
  end

  def gets_damage(damage)
    @life_points = @life_points - damage
    puts "Le joueur #{@name} a subit #{damage} dégats il lui reste #{@life_points} PV"
    if @life_points < 1
      print "Le "
      sleep(0.3)
      print"joueur "
      sleep(0.3)
      print"#{@name} "
      sleep(0.3)
      print"a "
      sleep(0.3)
      print"été "
      sleep(0.3)
      print"tué "
      sleep(0.3)
      puts"(CHEH!)"
    end
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level
  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level=1
  end 

  def compute_damage
    return rand(1..6)*@weapon_level
  end

  def search_weapon
   weapon_level = rand(1..6)
   if @weapon_level<weapon_level
     puts " vous avez trouvé une arme de niveau #{weapon_level} vous l'équipez ."
      @weapon_level = weapon_level
   else
     puts " cette arme(niv = #{weapon_level} ) est moins forte que votre arme actuelle (niv = #{@weapon_level})"
  end
  end

  def search_health_pack
    health_level = rand(1..6)
    if health_level == 1
      puts " rien n'a été trouvé"
    else
      if health_level == 6
        puts "Sac de 80 PV trouvé"
        @life_points = @life_points +80
    else
      puts "sac de 50 PV trouvé"
      @life_points = @life_points +50
    end
    if @life_points > 100
      @life_points = 100
    end
  end
  end
   
end  

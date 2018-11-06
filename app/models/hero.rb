class Hero < ApplicationRecord
  attr_reader :game_id 
  # enum h_class: [:Warrior, :Specialist, :Support, :Assassin]
  # enum h_game: [:Warcraft, :StarCraft, :Diablo, :Overwatch, :Blizzard]
  def game
    Game.find(self[:game_id])
  end
  
  def hero_class
    HeroClass.find(self[:hero_class_id])
  end
  def self.random
    top = (self.count)
    Hero.find(Random.rand(top)+ 1);
  end
  
  def self.tank    
    list = Hero.where(hero_class_id: 1)
    list.shuffle[0]
  end
  
  def self.spec
    list = Hero.where(hero_class_id: 2)
    list.shuffle[0]
  end
  
  def self.sup
    list = Hero.where(hero_class_id: 3)
    list.shuffle[0]
  end
  
  def self.assn
    list = Hero.where(hero_class_id: 4)
    list.shuffle[0]
  end
  
  def self.wc
    list = Hero.where(game_id: 1)
    list.shuffle[0]
  end
  
  def self.sc
    list = Hero.where(game_id: 2)
    list.shuffle[0]
  end
  
  def self.dibs
    list = Hero.where(game_id: 3)
    list.shuffle[0]
  end
  
  def self.ow
    list = Hero.where(game_id: 4)
    list.shuffle[0]
  end
  
  def self.blizz
    list = Hero.where(game_id: 5)
    list.shuffle[0]
  end
  
  def self.that_hero
  end
end

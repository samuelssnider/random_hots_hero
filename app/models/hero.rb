class Hero < ApplicationRecord
  attr_reader :game_id 
  has_one :game
  has_one :hero_class
  # enum h_class: [:Warrior, :Specialist, :Support, :Assassin]
  # enum h_game: [:Warcraft, :StarCraft, :Diablo, :Overwatch, :Blizzard]
  
  def self.random
    top = (self.count)
    Hero.find(Random.rand(top)+ 1);
  end
  
  def self.tank    
    list = Hero.where(hero_class: "Warrior")
    list.shuffle[0]
  end
  
  def self.spec
    list = Hero.where(hero_class: "Specialist")
    list.shuffle[0]
  end
  
  def self.sup
    list = Hero.where(hero_class: "Support")
    list.shuffle[0]
  end
  
  def self.assn
    list = Hero.where(hero_class: "Assassin")
    list.shuffle[0]
  end
  
  def self.wc
    list = Hero.where(game: "Warcraft")
    list.shuffle[0]
  end
  
  def self.sc
    list = Hero.where(game: "StarCraft")
    list.shuffle[0]
  end
  
  def self.dibs
    list = Hero.where(game: "Diablo")
    list.shuffle[0]
  end
  
  def self.ow
    list = Hero.where(game: "Overwatch")
    list.shuffle[0]
  end
  
  def self.blizz
    list = Hero.where(game: "Blizzard")
    list.shuffle[0]
  end
  
  def self.that_hero
  end
end

class Hero < ApplicationRecord
  # enum h_class: [:Warrior, :Specialist, :Support, :Assassin]
  # enum h_game: [:Warcraft, :StarCraft, :Diablo, :Overwatch, :Blizzard]
  
  
  def self.random
    top = (self.count + 1)
    Hero.find(Random.rand(top));
  end
  
  def self.tank
    list = Hero.where(h_class: "Warrior")
    list.shuffle[0]
  end
  
  def self.spec
    list = Hero.where(h_class: "Specialist")
    list.shuffle[0]
  end
  
  def self.sup
    list = Hero.where(h_class: "Support")
    list.shuffle[0]
  end
  
  def self.assn
    list = Hero.where(h_class: "Assassin")
    list.shuffle[0]
  end
  
  def self.wc
    list = Hero.where(h_game: "Warcraft")
    list.shuffle[0]
  end
  
  def self.sc
    list = Hero.where(h_game: "StarCraft")
    list.shuffle[0]
  end
  
  def self.dibs
    list = Hero.where(h_game: "Diablo")
    list.shuffle[0]
  end
  
  def self.ow
    list = Hero.where(h_game: "Overwatch")
    list.shuffle[0]
  end
  
  def self.blizz
    list = Hero.where(h_game: "Blizzard")
    list.shuffle[0]
  end
end

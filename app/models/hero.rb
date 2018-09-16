class Hero < ApplicationRecord
  enum h_class: [:Warrior, :Specialist, :Support, :Assassin]
  enum h_game: [:Warcraft, :StarCraft, :Diablo, :Overwatch, :Blizzard]
  
  
  def self.random
    top = (self.count + 1)
    Hero.find(Random.rand(top));
  end
end

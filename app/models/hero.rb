class Hero < ApplicationRecord
  enum h_class: [:Warrior, :Specialist, :Support, :Assassin]
  enum h_game: [:Warcraft, :StarCraft, :Diablo, :Overwatch, :Blizzard]
end

class Hero < ApplicationRecord
  belongs_to :image
  enum class: [:Warrior, :Specialist, :Support, :Assassin]
  enum game: [:Warcraft, :StarCraft, :Diablo, :Overwatch, :Blizzard]
end

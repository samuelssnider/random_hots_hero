require 'csv'
require 'json'

heroes = CSV.foreach "./db/data/characters.csv", headers: true, header_converters: :symbol

def class_gen(class)
  case class
  when "Warrior"
    marker = 0
  when "Specialist"
    marker = 1
  when "Support"
    marker= 2
  when "Assassin"
    marker = 3
  end
  marker
end

def game_gen(game)
  case game
  when "Warcraft"
    marker = 0
  when "StarCraft"
    marker = 1
  when "Diablo"
    marker= 2
  when "Overwatch"
    marker = 3
  when "Blizzard"
    marker = 4
  end
  marker
end

heroes.each do |hero|
  hero = hero.to_h
  puts hero[:name]
  
  Hero.create!(h_name:       hero[:name],
               h_class:      class_gen(hero[:class]),
               h_game:       game_gen(hero[:game]),
               h_created_at: hero[:created_at]
              )
end
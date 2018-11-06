require 'csv'
require 'json'
heroes = CSV.foreach "./db/data/characters.csv", headers: true, header_converters: :symbol

HeroClass.create!(name:"Warrior")
puts "Here"
HeroClass.create!(name:"Specialist")
HeroClass.create!(name:"Support")
HeroClass.create!(name:"Assassin")
Game.create!(name:"Warcraft")
Game.create!(name:"StarCraft")
Game.create!(name:"Diablo")
Game.create!(name:"Overwatch")
Game.create!(name:"Blizzard")

heroes.each do |hero|
  hero = hero.to_h
  puts hero[:name]
  Hero.create!(h_name:       hero[:name],
               hero_class_id:   HeroClass.find_by(name: hero[:class]).id,
               game_id:         Game.find_by(name:hero[:game]).id,
               h_created_at: hero[:created_at]
              )
end
require 'csv'
require 'json'

heroes = CSV.foreach "./db/data/characters.csv", headers: true, header_converters: :symbol

def class_gen(class)
  marker
  case class
  when "Warrior"
    marker = 0
  when "Specialist"
    marker = 1
  when "Support"
    marker= 2
  when :Assassin
end
  
heroes.each do |hero|
  hero = hero.to_h
  puts hero[:name]
  
  Hero.create!(h_name:       hero[:name],
               h_class:      hero[:class],
               h_game:       hero[:game].to_sym,
               h_created_at: hero[:created_at]
              )
end
require 'csv'
require 'json'

heroes = CSV.foreach "./db/data/characters.csv", headers: true, header_converters: :symbol

heroes.each do |hero|
  hero = hero.to_h
  puts hero[:name]
  Hero.create!(h_name:       hero[:name],
               h_class:      hero[:class].to_sym,
               h_game:       hero[:game].to_sym,
               h_created_at: hero[:created_at]
              )
end
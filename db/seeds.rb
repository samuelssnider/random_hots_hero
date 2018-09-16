require 'csv'
require 'json'

heroes = CSV.foreach "./db/data/characters.csv", headers: true, header_converters: :symbol

heroes.each do |hero|
  hero = hero.to_h
  puts hero[:name]
  Hero.create!(title:      hero[:name],
                class:      hero[:class],
                game:       hero[:hero],
                created_at: hero[:created_at]
              )
end
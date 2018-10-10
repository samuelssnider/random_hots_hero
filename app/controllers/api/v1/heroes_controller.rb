module Api
  module V1
    class HeroesController < ActionController::API
      def index
        if params["map"]
          map_it(params["map"])
        else 
          render json: Hero.all
        end
        
      end
      
      def show
        @deity = Hero.find(params[:id])
        render json: @deity
      end
      
      
      
      def map_it(input)
        req = input.chars
        classes = req[0..3]
        games = req[4..8]
        sorted_class_heroes = class_path(classes)
        sorted_game_heroes = games_path(games)
        require 'pry'; binding.pry;
        render json: sorted_class_heroes[Random.rand(sorted_class_heroes.count)+ 1]
      end
      
      def class_path(classes)
        heroes = []
        if (classes == ["n","n","n","n"] || classes == ["y","y","y","y"])
          heroes = Hero.all
        end
        if classes[0] == "y"
          heroes.push(*Hero.where(h_class: "Warrior"))
        end
        if classes[1] == "y"
          heroes.push(*Hero.where(h_class: "Specialist"))
        end
        if classes[2] == "y"
          heroes.push(*Hero.where(h_class: "Support"))
        end
        if classes[3] == "y"
          heroes.push(*Hero.where(h_class: "Assassin"))
        end
        heroes
      end
      
      def games_path(games)
        heroes = []
        if (games == ["n","n","n","n","n"] || games == ["y","y","y","y","y"])
          heroes = Hero.all
        else
          if games[0] == "y"
            heroes.push(*Hero.where(h_class: "Blizzard"))
          end
          if games[1] == "y"
            heroes.push(*Hero.where(h_class: "Diablo"))
          end
          if games[2] == "y"
            heroes.push(*Hero.where(h_class: "StarCraft"))
          end
          if games[3] == "y"
            heroes.push(*Hero.where(h_class: "Warcraft"))
          end
          if games[4] == "y"
            heroes.push(*Hero.where(h_class: "Overwatch"))
          end
        end
        heroes
      end
      
    end
  end
end
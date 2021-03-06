module Api
  module V1
    class HeroesController < ActionController::API
      def index
        if params["map"]
          map_it(params["map"])
        elsif params["gc"]
          if params["gc"] == "specialist" || params["gc"] == "support" || params["gc"] == "warrior"  || params["gc"] == "assassin" 
            render json: Hero.where(hero_class_id: HeroClass.find_by(name:params["gc"].capitalize).id).shuffle[0]
          elsif params["gc"] == "warcraft" || params["gc"] == "starcraft" || params["gc"] == "diablo"  || params["gc"] == "overwatch" || params["gc"] == "blizzard"
            if params["gc"] == "starcraft"
              sc = "StarCraft"
              render json: Hero.where(game_id: Game.find_by(name:sc).id).shuffle[0]
            else
              render json: Hero.where(game_id: Game.find_by(name:params["gc"].capitalize).id).shuffle[0]
            end
          else
          render json: Hero.all
        end
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
        mixture = commonality(sorted_game_heroes, sorted_class_heroes).compact
        render json: mixture[Random.rand(mixture.count)]
      end
      
      def commonality(sgh, sch)
        sgh.map do |ghero|
          if sch.any? {|chero| ghero == chero}
            ghero
          end
        end
      end
      
      def class_path(classes)
        heroes = []
        if (classes == ["n","n","n","n"] || classes == ["y","y","y","y"])
          heroes = Hero.all
        end
        if classes[0] == "y"
          heroes.push(*Hero.where(hero_class_id: 1))
        end
        if classes[1] == "y"
          heroes.push(*Hero.where(hero_class_id: 2))
        end
        if classes[2] == "y"
          heroes.push(*Hero.where(hero_class_id: 3))
        end
        if classes[3] == "y"
          heroes.push(*Hero.where(hero_class_id: 4))
        end
        heroes
      end
      
      def games_path(games)
        heroes = []
        if (games == ["n","n","n","n","n"] || games == ["y","y","y","y","y"])
          heroes = Hero.all
        else
          if games[0] == "y"
            heroes.push(*Hero.where(game_id: 5))
          end
          if games[1] == "y"
            heroes.push(*Hero.where(game_id: 3))
          end
          if games[2] == "y"
            heroes.push(*Hero.where(game_id: 2))
          end
          if games[3] == "y"
            heroes.push(*Hero.where(game_id: 1))
          end
          if games[4] == "y"
            heroes.push(*Hero.where(game_id: 4))
          end
        end
        heroes
      end
      
    end
  end
end
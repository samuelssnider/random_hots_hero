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
        require 'pry';
        binding.pry;
      end
      
      
    end
  end
end
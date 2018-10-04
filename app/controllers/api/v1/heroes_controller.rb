module Api
  module V1
    class HeroesController < ActionController::API
      def index
        require 'pry';
        binding.pry
        map_it(params["map"])
        render json: Hero.all
      end
      
      def show
        @deity = Hero.find(params[:id])
        render json: @deity
      end
      
      
      
      def map_it(input)
        require 'pry';
        binding.pry
      end
      
      
    end
  end
end
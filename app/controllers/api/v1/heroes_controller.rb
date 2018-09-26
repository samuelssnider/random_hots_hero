module Api
  module V1
    class HeroesController < ActionController::API
      def index
        render json: Hero.all
      end
      
      def show
        @deity = Hero.find(params[:id])
        render json: @deity
      end
    end
  end
end
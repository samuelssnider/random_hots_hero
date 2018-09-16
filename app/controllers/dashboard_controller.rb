class DashboardController < ApplicationController
  def index
    @heroes = Hero.all
  end
end

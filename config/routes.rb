Rails.application.routes.draw do
  root to: 'dashboard#index'
  
  namespace :api do
    namespace :v1 do
      resources :heroes, only: [:index, :show]
    end
  end
  
end

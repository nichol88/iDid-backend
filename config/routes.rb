Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :routines
      resources :actions
      resources :counters
      resources :users do
        resources :actions
      end

    end
  end
end

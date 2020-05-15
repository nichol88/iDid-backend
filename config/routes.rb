Rails.application.routes.draw do

  post 'api/v1/login' => 'api/v1/sessions#login'
  get 'api/v1/current_user' => 'api/v1/sessions#get_current_user'

  # root to: '/api/v1/'

  namespace :api do
    namespace :v1 do

      get 'login' => 'sessions#new'
      resources :routines
      resources :actions
      resources :counters
      resources :users do
        resources :actions
      end

    end
  end
end

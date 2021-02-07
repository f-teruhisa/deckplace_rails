Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # No use any routing provided by standard devise gem
  # But without writing `devise_for`, cannot use devise methods(ex. `current_xxx`)
  devise_for :users, skip: [:sessions, :passwords, :registrations]

  namespace :api do
    namespace :v1 do
      post '/login', to: 'session#log_in'
      post '/logout', to: 'session#log_out'
      get  '/user', to: 'users#show'
    end
  end
end

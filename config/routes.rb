Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # No use any routing provided by standard devise gem
  # But without writing `devise_for`, cannot use devise methods(ex. `current_xxx`)

  namespace :api do
    namespace :v1 do
      post '/login', to: 'session#log_in'
      post '/logout', to: 'session#log_out'
      get  '/user', to: 'users#show'
      devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    end
  end
end

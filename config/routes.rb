Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'

  post '/auth/developer/callback', to: 'sessions#create'
  get '/auth/failure', to: 'main#auth_fail'
  get '/logout', to: 'sessions#destroy', as: :logout
end

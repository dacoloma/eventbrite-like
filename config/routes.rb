Rails.application.routes.draw do

  #root 'static_pages#home'
  root 'events#index'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get  '/new_event',  to: 'events#new'
  post '/new_event',  to: 'events#create'

  post '/subscribe', to: 'events#subscribe'

  resources :users
  resources :events do
    get '/users', to: 'users#index'
    post '/invite', to: 'events#invite'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

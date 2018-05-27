Rails.application.routes.draw do
  
  mount Lockup::Engine, at: '/lockup'

  get 'timers/index'
  
  get '/stopwatch', to: 'timers#new'
  
  post '/stopwatch', to: 'timers#create'

  get 'static_pages/home'

  get 'static_pages/info', :defaults => { :format => 'json' }
  
  get '/login', to: 'sessions#new'
  
  post '/login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  root 'static_pages#home'
  
  resources :timers

end

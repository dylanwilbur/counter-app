Rails.application.routes.draw do
  
  mount Lockup::Engine, at: '/lockup'

  get 'timers/index'
  
  get '/for-teachers', to: 'static_pages#for_teachers'

  get '/about', to: 'static_pages#about'
  
  get '/login', to: 'sessions#new'
  
  post '/login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  
  patch '/newStory', to: 'timers#newStory'
  
  get '/contact', to: 'static_pages#contact'
  
  get '/inspiration', to: 'static_pages#inspiration'

  root 'static_pages#home'
  
  resources :timers
  resources :timer_mailers, only: [:edit]
  resources :stories
end

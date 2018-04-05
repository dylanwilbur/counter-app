Rails.application.routes.draw do
  get 'timers/index'
  
  get '/stopwatch', to: 'timers#new'
  
  post '/stopwatch', to: 'timers#create'

  get 'static_pages/home'

  get 'static_pages/info'

  root 'static_pages#home'
  
  resources :timers
end

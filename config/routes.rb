Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/info'

  root 'static_pages#home'
end

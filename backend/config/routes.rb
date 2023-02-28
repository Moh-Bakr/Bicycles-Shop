Rails.application.routes.draw do

  resources :bicycles
  # get 'bicycle/search/:search/', to: 'bicycles#search'

  post 'auth/register', to: 'users#register'
  post 'auth/login', to: 'users#login'

end

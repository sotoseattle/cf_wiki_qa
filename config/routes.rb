Rails.application.routes.draw do

  devise_for :users
  get '/users_list/:u' => 'pages#userlist'

  resources :pages
  root 'pages#index'
end

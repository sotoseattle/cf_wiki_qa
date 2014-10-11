Rails.application.routes.draw do

  devise_for :users
  get '/users/editorship/:user_id' => 'users#editorship'

  resources :pages
  root 'pages#index'
end

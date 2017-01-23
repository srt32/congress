Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  root to: 'pages#main'

  get '/about', to: 'pages#about'
end

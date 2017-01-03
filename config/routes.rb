Rails.application.routes.draw do
  root to: 'pages#main'

  get '/about', to: 'pages#about'
end

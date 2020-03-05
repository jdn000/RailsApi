Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users/all', to: 'admin#list_users'
  delete '/users/:username', to: 'admin#destroy',param: :_username
  resources :users, param: :_username, only: [:index,:create,:update,:show]
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

end

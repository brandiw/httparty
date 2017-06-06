Rails.application.routes.draw do
  get 'favorites/index'

  root 'main#index'

  post 'search' => 'main#search'

  get 'show/:id' => 'main#show'

  resources :favorites

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

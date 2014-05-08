Daycare::Application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :daycare_pokemons, path: 'daycare'
end

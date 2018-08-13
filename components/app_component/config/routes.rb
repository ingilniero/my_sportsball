AppComponent::Engine.routes.draw do
  resources :games
  resources :teams
  resources :predictions, only: %i[new create]
  root to: 'welcome#index'
end

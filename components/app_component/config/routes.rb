AppComponent::Engine.routes.draw do
  resources :teams
  resources :predictions, only: %i[new create]

  root to: 'welcome#show'
end

Rails.application.routes.draw do
  root :to => "homepage#show"

  resources :artists do
    resources :songs, only: [:new, :create]
  end

  resources :songs, only: [:show]
  resources :playlists, only: [:index, :new, :create, :show]
end

Rails.application.routes.draw do
  devise_for :users
  resources :movies
  resources :shows
  resources :seasons
  resources :episodes
  resources :peoples
  resources :users

  get '/shows/:show/season/:season', to: 'seasons#show'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

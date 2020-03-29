# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new', to: 'users#new'
  post 'users/new', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'home#top'
  resources :plans
end

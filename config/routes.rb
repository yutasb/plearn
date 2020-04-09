# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new', to: 'users#new'
  post 'users/new', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'home#top'

  resources :activities do
    resources :plans
  end
  post '/activities/:activity_id/plans/new', to: 'plans#create', as: 'create_activity_plan'
end

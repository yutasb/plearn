# frozen_string_literal: true

Rails.application.routes.draw do
  get '/users/new' => 'users#new'
  post 'users/new' => 'users#create'

  root 'home#top'
  resources :plans
end

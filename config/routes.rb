# frozen_string_literal: true

Rails.application.routes.draw do
  # 　アカウント登録
  get 'users/new', to: 'users#new'
  post 'users/new', to: 'users#create'
  # 　プロフィール編集
  get 'users/edit', to: 'users#edit'
  patch 'users/edit', to: 'users#update'
  # 　ログイン
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'home#top'

  resources :activities do
    resources :plans
  end
  post '/activities/:activity_id/plans/new', to: 'plans#create', as: 'create_activity_plan'
end

# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :clients
  resources :products
  resources :pictures
  resources :comments, only: %i[index new show create]

  namespace :admin do
    resources :comments, only: %i[destroy]
  end

  # scope module: 'admin' do
  #   resources :comments, only: %i[destroy]
  # end

  # scope '/admin' do
  #   resources :comments
  # end

  root to: 'home#index'
end

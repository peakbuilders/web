# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  resources :accounts
  resources :members, only: [:show]

  namespace :admin do
    resources :accounts

    root to: 'accounts#index'
  end
end

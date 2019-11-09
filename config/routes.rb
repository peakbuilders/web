# frozen_string_literal: true

Rails.application.routes.draw do
  get 'profiles/edit'
  devise_for :accounts

  resources :accounts
  resources :members, only: [:index, :show]
  resources :profiles, only: [:edit]

  namespace :admin do
    resources :accounts

    root to: 'accounts#index'
  end
end

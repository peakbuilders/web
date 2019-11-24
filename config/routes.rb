# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts, skip: [:registrations]

  resources :accounts, only: %i[new create]
  resources :payments, only: %i[new create]
  resources :members, only: %i[index show]
  resources :profiles, only: [:edit]

  namespace :admin do
    resources :accounts

    root to: 'accounts#index'
  end
end

# frozen_string_literal: true

Rails.application.routes.draw do
  resources :accounts

  namespace :admin do
    resources :accounts

    root to: 'accounts#index'
  end
end

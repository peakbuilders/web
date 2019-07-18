# frozen_string_literal: true

Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  resources :accounts
end

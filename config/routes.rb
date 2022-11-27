# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  root to: 'practices#index'
  resources :practices
  resources :targets, only: %i[new create update]
end

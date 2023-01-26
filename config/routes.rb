# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end

  root to: 'practices#index'
  resources :practices
  resources :targets, only: %i[new create edit update]

  resources :how_to_uses, only: [:index]
  resources :privacy_policies, only: [:index]
  resources :terms_of_services, only: [:index]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

# frozen_string_literal: true

Rails.application.routes.draw do
  # enable customization of devise gem
  devise_for :users, controllers:  { registrations: 'api/v1/registrations' }

  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
  resources :people
  # root "user#index"

  namespace "api" do
    namespace "v1" do

      root 'articles#index'
      resources :articles, :doctors, :patients, :appointments, :home
      # resources :users, except: :create
      # resources :registrations
      # devise_scope :api/v1, defaults: {format: :json} do
      #   post '/', to: 'registrations#create'
      # end
      # resources :sessions, only: [:create, :destroy]

    end
  end
end

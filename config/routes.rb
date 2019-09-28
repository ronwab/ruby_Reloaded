# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
  resources :people
  # root "user#index"

  namespace "api" do
    namespace "v1" do
      resources :articles, :doctors, :patients, :appointments, :users
      resources :sessions, only: [:create, :destroy]
    end
  end
end

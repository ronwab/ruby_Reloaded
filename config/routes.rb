# frozen_string_literal: true

Rails.application.routes.draw do
  # enable customization of devise gem
  devise_for :users, controllers: {registrations: 'api/v1/registrations' , sessions: 'api/v1/sessions'}

  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
  resources :people
  # root "user#index"

  namespace "api" do
    namespace "v1" do

      root 'articles#home'
      resources :articles, :doctors, :patients, :appointments, :home
    end
  end
end

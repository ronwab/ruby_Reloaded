# frozen_string_literal: true

Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
  resources :people
  namespace "api" do
    namespace "v1" do
      resources :articles, :doctors, :patients, :appointments, :users
    end
  end
end

Rails.application.routes.draw do
  resources :people
namespace 'api' do
  namespace 'v1' do
    resources :articles, :doctors, :patients, :appointments
  end
  end
end

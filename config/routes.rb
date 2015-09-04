Rails.application.routes.draw do
  resources :people, only: [:new, :create, :index]
end

Rails.application.routes.draw do
  devise_for :users
  resources :contacts do
    member do

    end
  end

  resources :portfolios

  resources :services

  resources :abouts

  resources :galleries

  resources :homes do
    collection do
      get :read_more
    end
  end

  resources :notifications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#index'
end


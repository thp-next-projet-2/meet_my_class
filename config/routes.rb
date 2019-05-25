# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :teachers
  devise_for :students

  resources :teachers, only: [:show]
  namespace :teachers do
    resources :klasses
  end

  resources :klasses, :students

  resources :visitors, only: [:index]
  root to: 'visitors#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

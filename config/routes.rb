# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :klasses do
    get 'students/index'
    get 'students/new'
    get 'students/create'
  end
  devise_for :teachers
  devise_for :students, controllers: {
    confirmations: 'students/confirmations',
    passwords: 'students/passwords'
  }

  resources :klasses do
    resources :students, only: %i[index new create]
    resources :attendances, except: %i[edit]
  end
  resources :students, only: %i[show edit update destroy]

  root 'klasses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

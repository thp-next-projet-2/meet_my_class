# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :teachers
  devise_for :students, controllers: {
    confirmations: 'students/confirmations'
  }

  resources :students, only: %i[index]

  root 'students#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

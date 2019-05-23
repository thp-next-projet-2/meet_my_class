# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  # namespace :klasses do
  #  get 'students/index'
  #  get 'students/new'
  #  get 'students/create'
  # end
  devise_for :teachers
  resources :teachers, only: %i[index show]
  namespace :teachers do
    resources :klasses
  end
  # SEE: https://github.com/plataformatec/devise/wiki/How-To:-Email-only-sign-up
  devise_for :students, controllers: {
    confirmations: 'students/confirmations',
    passwords: 'students/passwords',
    registrations: 'students/registrations'
  }
  resources :students do
    resources :attendances
  end
  namespace :students do
    resources :klasses
  end

  root 'teachers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

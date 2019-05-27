# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :klasses do
    resources :questions do
      resources :upvotes, except: :show
    end
    resources :steps
    resources :attendances
  end

  resources :progressions

  devise_for :teachers
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'klasses#index'
end

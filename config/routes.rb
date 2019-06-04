# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :klasses do
    resources :questions, except: :index do
      resources :upvotes, only: %i[create destroy]
    end
    resources :steps, except: %i[index new]
    resources :attendances
  end

  resources :progressions, only: %i[create destroy]

  # devise_for  :teachers
  # resources   :teachers, only: [:show]
  namespace   :teachers do
    resources :klasses
    # resources :klasses, :controller => 'teachers/klasses'
  end

  # devise_for :students
  # resources  :students, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

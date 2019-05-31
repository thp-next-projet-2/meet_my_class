# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :klasses do
    resources :questions, except: [:index] do
      resources :upvotes, except: [:show]
    end
    resources :steps
    resources :attendances
  end

  resources :progressions, only: %i[create destroy]

  devise_for  :teachers
  resources   :teachers
  namespace   :teachers do
    resources :klasses
    # resources :klasses, :controller => 'teachers/klasses'
  end

  devise_for :students
  resources  :students

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

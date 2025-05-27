# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'home#index'

    resources :movies do
      # BEGIN
      scope module: :movies do
        resources :comments
        resources :reviews
      end
      # END
    end

    resources :reviews, only: %i[index]
  end
end

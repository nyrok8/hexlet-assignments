# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  resources :posts do
    resources :post_comments, except: %i[index show]
  end

  resources :post_comments, only: [:update]
  # END
end

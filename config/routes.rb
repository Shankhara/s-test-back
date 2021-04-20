# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :combats, only: %i[index create]
      resources :pokemons, only: %i[index show]
    end
  end
end

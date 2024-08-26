Rails.application.routes.draw do
  resources :courses, only: %i[create update index]
end

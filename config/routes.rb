Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :imcs, only: [:create]
    end
  end
end

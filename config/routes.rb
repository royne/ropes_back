Rails.application.routes.draw do
  default_url_options :host => "http://localhost:4000"

  namespace :api do
    namespace :v1 do

      resources :products
      resources :categories
      resources :colors
      resources :messages, only: [:index, :create]

    end
  end

end

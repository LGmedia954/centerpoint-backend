Rails.application.routes.draw do

  post "/api/v1/login", to: "api/v1/sessions#create"
  post "/api/v1/signup", to: "api/v1/users#create"
  delete "/api/v1/logout", to: "api/v1/sessions#destroy"
  get "/api/v1/get_current_user", to: "api/v1/sessions#get_current_user"

  get "/api/v1/organizations", to: "api/v1/organizations#index"
  get "/api/v1/mybiz", to: "api/v1/organizations#mybiz"
  get "/api/v1/about", to: "api/v1/static#about"
  get "/api/v1/contact", to: "api/v1/static#contact"
  get "/api/v1/invite", to: "api/v1/static#invite"
  get "/api/v1/announcements", to: "api/v1/announcements#index"

  namespace :api do
    namespace :v1 do
      resources :directories
      resources :categories
      resources :announcements

      resources :users do
        resources :organizations, only: [:new, :create, :index, :show, :destroy]
      end

      resources :organizations
      resources :users

    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

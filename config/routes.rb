Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  authenticated :user do
    root to: "groups#index", as: :authenticated_root
  end

  resources :groups, only: [:new, :create, :index] do
    resources :deals, only: [:new, :create, :index]
  end

  root to: "splash#index"
end

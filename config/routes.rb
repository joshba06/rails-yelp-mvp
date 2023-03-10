Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  with_options(only: [:index, :show, :new, :create]) do |opt|
    opt.resources :restaurants do
      member do
        resources :reviews, only: [:new, :create]
      end
    end
  end
end

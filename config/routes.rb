Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "pages#home"

  resources :drivers, only: [:index, :show]
  resources :races, only: [:index, :new, :create]
  resources :tracks, only: [:index, :show]

  resources :circuits do
    resources :comments
    resources :tracks
  end

  resource :my_profile, only: [:show, :edit, :update], controller: 'my_profile'

  scope :auth do
    get "failure" => "auth0#failure"
    get "logout" => "auth0#logout"

    scope :auth0 do
      get "callback" => "auth0#callback"
    end
  end

end

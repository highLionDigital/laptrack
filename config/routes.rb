Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "pages#home"
  resources :tracks, only: [:index, :show]

  resources :circuits do
    resources :tracks
  end

  get "/my_profile" => "my_profile#show"

  scope :auth do
    get "failure" => "auth0#failure"
    get "logout" => "auth0#logout"

    scope :auth0 do
      get "callback" => "auth0#callback"
    end
  end

end

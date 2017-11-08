Rails.application.routes.draw do
  get 'calendar/show'
  resource :calendar, only: [:show], controller: :calendar

  resources :rentals
  
  resources :conversations do
    resources :messages
  end
  
  resources :tools
  resources :profiles
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

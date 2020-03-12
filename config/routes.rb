Rails.application.routes.draw do
  devise_for :users
  root to: "top#index" 
  resources :companies do
    resources :schedules ,only: [:index, :new, :create]
    resources :future_taxes ,only: [:index, :new, :create]
  end
end

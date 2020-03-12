Rails.application.routes.draw do
  root to: "top#index" 
  resources :companies do
    resources :schedules ,only: [:index, :new, :create]
    resources :future_taxes ,only: [:index, :new, :create]
  end
end

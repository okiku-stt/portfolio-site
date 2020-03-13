Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  root to: "top#index" 
  resources :companies do
    resources :schedules ,except: [:show]
    resources :future_taxes ,except: [:show]
  end
end

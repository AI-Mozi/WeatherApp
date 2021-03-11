Rails.application.routes.draw do
  devise_for :users,  :controllers => {
    registrations: 'registrations',
    confirmations: 'confirmations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'locations#new'

  resources :logged_user do
    member do
      get :confirm_email
    end
  end

  resources :locations do
    
  end
end

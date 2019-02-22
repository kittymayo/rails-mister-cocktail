Rails.application.routes.draw do
  # root to:  '/cocktails'
  delete '/doses/:id', to: 'doses#destroy', as: :delete_dose
  resources :cocktails, except: [:index] do
    resources :doses, only: [:new, :create]
    resources :ingredients, only: [:new, :create, :destroy]
  end
  root to: "cocktails#index"
end

Rails.application.routes.draw do
  # root to:  '/cocktails'
  delete '/doses/:id', to: 'doses#destroy', as: :delete_dose
  resources :cocktails do
    resources :doses, only: [:new, :create, :destroy]
    resources :ingredients, only: [:new, :create, :destroy]
  end
end

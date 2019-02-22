Rails.application.routes.draw do
  # root to:  '/cocktails'
  delete '/cocktails/:id', to: 'cocktails#destroy', as: :delete_cocktail
  delete '/doses/:id', to: 'doses#destroy', as: :delete_dose
  get '/cocktails', to: "cocktails#index", as: :cocktail_index

  resources :cocktails, except: [:index] do
    resources :doses, only: [:new, :create]
    resources :ingredients, only: [:new, :create, :destroy]
  end
  root to: "cocktails#index"
end

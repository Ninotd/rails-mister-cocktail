Rails.application.routes.draw do

  resources :cocktails, only: [ :index, :show, :create ] do
    resources :doses, only: [:create]
  end
  resources :doses, only: :destroy

  root to: "cocktails#index"
  # delete "doses/:id", to: "doses#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

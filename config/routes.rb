Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "controller#action"

  resources :restaurants do
    resources :reviews, only: [ :new, :create ]
  end

  resources :reviews, only: [ :show, :edit, :update, :destroy ]

end

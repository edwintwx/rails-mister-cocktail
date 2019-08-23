Rails.application.routes.draw do

  resources :cocktails do #, only: [:index, :show, :new, :create]
    resources :doses, only: [ :index, :new, :create ]
  end

  resources :doses, only:  [ :show, :edit, :update, :destroy ]

  root 'cocktails#index'
  # A user can see the list of cocktails
  # GET "cocktails"

  # A user can see the details of a given cocktail, with the dose needed for each ingredien
  # GET "cocktails/42"

  # A user can create a new cocktail
  # GET "cocktails/new"
  # POST "cocktails"
end

Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/new'
  get 'recipes/create'
  get 'recipes/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do 
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  get '/', to: 'tops#index'
  get 'about', to: 'tops#about'
  resources :accounts, :only => [:show, :edit, :update] do
    collection do
      get 'withdrawal'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

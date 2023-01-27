Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  get '/', to: 'tops#index'
  get 'about', to: 'tops#about'
  resources :accounts, only: %i[show edit update] do
    collection do
      get 'withdrawal'
    end

    member do
      get 'release'
    end
  end

  resources :recipes, only: %i[index new create show edit update destroy] do
    resource :favorite, only: %i[create destroy]

    member do
      get 'release'
    end

    collection do
      get 'search'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

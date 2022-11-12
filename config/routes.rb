Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do {
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  }
  get '/', to: 'tops#index'
  get 'about', to: 'tops#about'
  resources :accounts, :only => [:show, :edit, :update]
  post '/tops/guest_sign_in', to: 'tops#guest_sign_in'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

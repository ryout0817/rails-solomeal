Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get '/', to: 'tops#index'
  get 'about', to: 'tops#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

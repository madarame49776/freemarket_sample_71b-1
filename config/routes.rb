Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root "home#index"
  
  resources :products
  resources :users, only: [:index, :show, :new, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  $date = Time.now.in_time_zone('Tokyo').to_s
end

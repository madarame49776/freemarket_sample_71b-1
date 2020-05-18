Rails.application.routes.draw do
  $date = Time.now.in_time_zone('Tokyo').to_s
  root "products#index"
  resources :products, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

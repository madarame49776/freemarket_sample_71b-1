Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root "home#index"
  
  resources :products, except: [:index]  do 
  #カテゴリーを表示させるためのルーティングを設定
  #do~endと書かなかったためエラーになった
  collection do 
    get 'new/children_category', to: 'products#children_category'
    get 'new/grandchildren_category', to: 'products#grandchildren_category'
  end
    get 'new/children_category', to: 'products#children_category'
    get 'new/grandchildren_category', to: 'products#grandchildren_category'
  end

  
  resources :users, only: [:index, :show, :new, :edit]

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  # resources :purchace, only: [:index] do
  #   collection do
  #     get 'index', to:'purchase#index'
      post 'pay', to:'purchase#pay'
      get 'done', to:'purchase#done'
  #   end
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  $date = Time.now.in_time_zone('Tokyo').to_s
end

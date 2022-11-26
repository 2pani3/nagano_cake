Rails.application.routes.draw do
  root to: "public/homes#top"
  get 'about'=>'public/homes#about'
# 会員側
    devise_for :customer, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
# 管理者側
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 会員
  scope module: :public do
    resources :items, only: [:index, :show]
    resource :customers,only: [:show, :edit]
    patch 'customers/information' => 'customers#update', as:'information'
    get 'customers/quit' => 'customers#quit', as:'quit'
    patch 'customers/withdrawal' => 'customers#withdrawal', as:'withdrawal'

    delete 'cart_items/all_destroy' => 'cart_items#all_destroy', as:'all_destroy'
    resources :cart_items,only: [:index, :update, :destroy, :create]

    get 'orders/complete' => 'orders#complete', as:'complete'
    post 'orders/check' => 'orders#check', as:'check'
    resources :orders,only: [:index, :new, :show, :create]

    resources :addresses,only: [:index, :create, :edit, :update, :destroy]
  end
  # 管理者
  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders,only: [:show, :update]
    resources :order_details,only: [:update]
  end

end

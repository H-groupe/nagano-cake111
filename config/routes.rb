Rails.application.routes.draw do

  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root to: 'homes#top'
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, except: [:destroy]
    resources :order_details, only: [:update]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :addresses, only: [:index, :edit]
    resources :oders, only: [:new, :index, :show]
    resources :cart_items, only: [:index, :update, :create, :destroy ] do
      get 'destroy_all' => 'cart_items#destroy_all'
    end
    resource :customers, only: [:show, :edit, :update] do
      collection do
        get 'check' => 'customers#check'
        patch 'withdraw' => 'customers#withdarw'
      end
    end
    resources :items, only: [:index, :show]
  end

end

Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resource :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, except: [:destroy]
    resource :order_details, only: [:update]
  end
  
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get '/customers/information/edit' => 'customers#edit',as: 'customers_edit'
    patch '/customers/information' => 'customers#update',as: 'customers_update'
    get '/customers/my_page' => 'customers#show',as:'customers_show'
    resources :addresses, only: [:index, :edit, :update, :create, :destroy]
    resources :orders, only: [:new, :index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete "all_destroy"   
      end 
    end
    resources :customers do
      collection do
        get 'check' => 'customers#check'
        patch 'withdraw' => 'customers#withdraw'
      end
    end
    resources :items, only: [:index, :show]
  end
end
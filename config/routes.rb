Rails.application.routes.draw do

  # root 'homes#top'
  # namespace :admin do
  # root 'homes#top'
  # end
  get 'home/about'=>'homes#about'

  # devise_for :customers
  root to: 'homes#top'


  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
    }
  namespace :admin do
    devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    }
  end

  get 'customers/my_page'=>'customers#show'
  get 'customers/unsubscribe'=>'customers#unsubscribe'
  patch 'customers/withdraw'=>'customers#withdraw'

  resources :customers, only: [:show, :edit, :update, :destroy]
    namespace :admin do
  resources :customers, only: [:index,:show, :edit, :update]
  end

  resources :orders, only: [:new, :index, :show, :confirm, :thanks, :create]
    namespace :admin do
  resources :orders, only: [:show, :update]
  end




  resources :products, only:[:index, :show,]
    namespace :admin do
  resources :products, only:[:index, :new, :create, :show, :edit, :update]
  end

  namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
  end

  namespace :admin do
    resources :order_details, only:[:update]
  end

  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :registrations, only:[:new, :create]
  resources :sessions, only:[:new, :create, :destroy]

end
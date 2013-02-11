HelloWorldTests::Application.routes.draw do

  root :to => "home#index"
  get 'admin' => "auth_admin#index"

  controller :auth_sessions do
    get 'auth_login' => :new
    post 'auth_login' => :create
    delete 'auth_logout' => :destroy
    get 'auth_logout' => :destroy
  end

  resources :auth_users
  resources :shop_items, :google_map, :shop_carts
  resources :user_orders
  resources :cars
  resources :fb_users, :only => [:index]
  resources :frogs
  resources :my_test_scaffolds do
    get :who_bought_this, :on => :member
  end

  match 'svetik/home' => 'svetik#home'
  match 'say/hello' => 'say#hello'
  match 'say/goodbye' => 'say#goodbye'
  match 'my_store' => 'my_store#index'
  match 'resque_que' => 'resque_que#index'
  mount Resque::Server, :at => "/resque"
end

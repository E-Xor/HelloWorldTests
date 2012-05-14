HelloWorldTests::Application.routes.draw do

  # Automaticaly added by scaffold generator
  resources :auth_users

#  get "home/index"
  # Automaticaly added by controller generator
#  get "my_store/index"
#  get "google_map/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Added for correct scaffold work
  resources :shop_items, :google_map, :shop_carts
  resources :user_orders
  resources :my_test_scaffolds do
    get :who_bought_this, :on => :member
  end
  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"
  # Default index
#  root :to => "my_store#index", :as => 'my_store'
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #match ':controller(/:action(/:id(.:format)))'
  match 'svetik/home' => 'svetik#home'
  match 'say/hello' => 'say#hello'
  match 'say/goodbye' => 'say#goodbye'
  match 'my_store' => 'my_store#index'
#  match 'shop_items' => 'shop_items#index'
#  match 'new_shop_item' => 'shop_items#new'
#  match 'google_map/index' => 'google_map#index'


end

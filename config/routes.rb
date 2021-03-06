Store::Application.routes.draw do
  get "users/new"

  get "site/about_us"
  get "site/contact_us"
  get "site/blog"

  resources :products
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/modal' => "products#modal"
  match 'fbconnect' => 'users#fbconnect'
  
  # Cart Routes
  match '/cart' => 'carts#index'
  match '/carts/insert-into-cart' => 'carts#insert_into_cart', :via => :post
  match 'blog' => 'site#blog'
  match 'update-quantity' => 'carts#update_quantity', :via => :post
  
  # Cart Routes
  match '/orders/new' => 'orders#new'
  match '/orders/create' => 'orders#create'
  match '/orders/thank-you' => 'orders#thank_you'
  # Mobile Routes.
  scope "/mobile", :as => "mobile" do
    match "/" => "mobile/sessions#new", :via => :get
    match "/products" => "mobile/products#index"
    match "/sessions" => "mobile/sessions#create", :via => :post
    match "/home" => "mobile/site#home"
    match "/contact-us" => "mobile/site#contact_us"
  end

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

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'products#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  match '*a', :to => 'products#index'
end

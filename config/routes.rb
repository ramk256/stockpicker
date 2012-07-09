StockPicker::Application.routes.draw do
  get "stock/add"

  get "stock/display"
 
  #if the user submits form, we do a post

  #get "user" => 'user#index'
  
  #resources :user, :controller => 'user' 
  #root :to => 'user#index', :as => :users
  
  #this is what:
  #resources :user, :controller => 'user' does 
  #the 'as' creates new path name helpers
  get 'user/showall' => 'user#showall', :as => :showall
  get    'user'          => 'user#index', :as => :user
  get    'user/new'      => 'user#new',   :as => :new_user
  post   'user'          => 'user#create'
  get    'user/:id'      => 'user#show',  :as => :user_id
  get    'user/:id/edit' => 'user#edit',  :as => :edit_user
  put    'user/:id'      => 'user#update'
  delete 'user/:id'      => 'user#destroy'
  
  
  #now we need to define routes for the session as well, which has
  #new, create, and destroy actions
  
  get 'session/new'      => 'session#new', :as => :new_session
  post 'session'         => 'session#create', :as => :session
  delete 'session/:id'   => 'session#destroy', :as => :session_id
  
  get '/signup' => 'user#index', :as => :signup
  get '/signin' => 'session#new', :as => :signin
  delete '/signout' => 'session#destroy', :as => :signout
  
  
  #get "/" => 'user#index'
  
  root :to => 'user#index'
  
  match 'user/:id' => 'user#show'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

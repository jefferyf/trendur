Trendur::Application.routes.draw do  

  resources :authentications

  match '/auth/:provider/callback' => 'authentications#create' #uses :provider so that it can be any provider, like Twitter, Facebook, or Linked_In
  match '/auth/failure' => "home#index"

  devise_for :users, :controllers => { :registrations => 'registrations' }, :path_names => { :sign_up => "register"}
  devise_scope :user do
    match '/login' => 'devise/sessions#new'
    match '/logout' => 'devise/sessions#destroy'
  end
  
  namespace :admin do
    match "/" => "dashboard#index"
    match "/user_management" => "user_management#index"
    resources :authentications
    resources :users
    resources :categories
    resources :twitter_lists
  end
  #match "/admin/user_management"
  
  #resources :categories
  match "categories" => "categories#index" , :as => "category"
  match "categories/:name" => "categories#show" , :as => "categoryshow"
  resources :user, :controller => "user" #Gertig, devise-roles-user-management
  resources :home


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
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
end

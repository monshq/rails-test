Myapp::Application.routes.draw do
  get "static_pages/about"
  get "static_pages/signup"
  get "static_pages/help"

  resources :microposts
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions,    only: [:new, :create, :destroy]
  resources :microposts,  only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  get '/signup',  to: 'users#new'
  get '/signin',  to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'#, via: :delete

  root to: 'static_pages#home', via: :get
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

#== Route Map
# Generated on 26 Jan 2013 20:43
#
# static_pages_signup GET    /static_pages/signup(.:format) static_pages#signup
#   static_pages_help GET    /static_pages/help(.:format)   static_pages#help
#          microposts GET    /microposts(.:format)          microposts#index
#                     POST   /microposts(.:format)          microposts#create
#       new_micropost GET    /microposts/new(.:format)      microposts#new
#      edit_micropost GET    /microposts/:id/edit(.:format) microposts#edit
#           micropost GET    /microposts/:id(.:format)      microposts#show
#                     PUT    /microposts/:id(.:format)      microposts#update
#                     DELETE /microposts/:id(.:format)      microposts#destroy
#      following_user GET    /users/:id/following(.:format) users#following
#      followers_user GET    /users/:id/followers(.:format) users#followers
#               users GET    /users(.:format)               users#index
#                     POST   /users(.:format)               users#create
#            new_user GET    /users/new(.:format)           users#new
#           edit_user GET    /users/:id/edit(.:format)      users#edit
#                user GET    /users/:id(.:format)           users#show
#                     PUT    /users/:id(.:format)           users#update
#                     DELETE /users/:id(.:format)           users#destroy
#            sessions POST   /sessions(.:format)            sessions#create
#         new_session GET    /sessions/new(.:format)        sessions#new
#             session DELETE /sessions/:id(.:format)        sessions#destroy
#                     POST   /microposts(.:format)          microposts#create
#                     DELETE /microposts/:id(.:format)      microposts#destroy
#       relationships POST   /relationships(.:format)       relationships#create
#        relationship DELETE /relationships/:id(.:format)   relationships#destroy
#              signup GET    /signup(.:format)              users#new
#              signin GET    /signin(.:format)              sessions#new
#             signout DELETE /signout(.:format)             sessions#destroy
#                root GET    /                              static_pages#home

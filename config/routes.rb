Step1::Application.routes.draw do



  root :to => "users#new"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "my_details" => "users#my_details", :as => "my_details"
  get "user_posts" => "posts#user_posts", :as => "user_posts"
  get "my_posts" => "posts#my_posts", :as => "my_posts"
  get "popular_posts" => "posts#popular", :as => "popular_posts"
  get "latest_posts" => "posts#latest", :as => "latest_posts"
  get "oldest_posts" => "posts#oldest", :as => "oldest_posts"
  get "category_posts" => "posts#category_posts", :as => "category_posts"
  get "post_comments" => "comments#comments", :as => "post_comments"
  get "get_step_comments" => "scomments#get_step_comments", :as => "get_step_comments"
  get "am_i_signed_in" => "sessions#am_i_signed_in", :as => "am_i_signed_in"
  get "rate_comment" => "comments#rate_comment", :as => "rate_comment"
  get "rate_step_comment" => "scomments#rate_step_comment", :as => "rate_step_comment"
  get "rate_post" => "posts#rate_post", :as => "rate_post"
  get "posts/:ispublic/:category/:title/:difficulty" => "posts#create"
  get "getapost" => "posts#getapost", :as => "getapost"
  get "setfinished" => "posts#setfinished", :as => "setfinished"
  get "search_posts" => "posts#search_posts", :as => "search_posts"
  post "send_message" => "messages#send_message", :as => "send_message"
  get "my_messages" => "messages#my_messages", :as => "my_messages"
  get "get_email" => "messages#get_email", :as => "get_email"
  get "user_details" => "users#user_details", :as => "user_details"



  resources :messages
  resources :users
  resources :sessions
  resources :comments
  resources :posts
  resources :steps
  resources :scomments

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

Rails.application.routes.draw do
  

  devise_for :users
  root 'home#index'
  
  get 'home/index'
  get '/home/new'
  get '/home/posts'
  post '/home/create'
  get '/home/edit/:id' => 'home#edit'
  post '/home/update/:id' => 'home#update'
  get 'home/destroy/:id' => 'home#destroy'
  post '/home/comment_create/:id' => 'home#comment_create'
  get 'likes/toggle/:id' => "likes#toggle"
  get '/home/posts/:id' => "home#posts"
  get '/home/all_post'
  get '/home/search'
  get '/home/profile/:id' => 'home#profile'
  get '/home/profile_posts/:id' => "home#profile_posts"
  get '/follow/create/:id' => "follow#create"
  get '/follow/destroy/:id' => "follow#destroy"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

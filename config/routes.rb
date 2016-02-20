Rails.application.routes.draw do
  get "/projects/new" => "projects#new", as: :new_project
  post "/projects" => "projects#create", as: :projects
  get "/projects/:id" => "projects#show", as: :project
  get "/projects" => "projects#index"
  get "/projects/:id/edit" => "projects#edit", as: :edit_project
  patch "/projects/:id" => "projects#update"
  delete "/projects/:id" => "projects#destroy"





# get "/tasks/new" => "tasks#new", as: :new_task
# post "/tasks" => "tasks#create", as: :tasks
# get "/tasks" => "tasks#index"
# get "/tasks/:id" => "tasks#show", as: :task
# get "/tasks/:id/edit" => "tasks#edit", as: :edit_task
# patch "tasks/:id" => "tasks#update"
# delete "tasks/:id" => "tasks#destroy"



resources :projects, only: [] do
  resources :tasks, only: [:new, :create, :update, :destroy]
    resources :discussions, only: [:new, :create, :show, :destroy, :update, :edit]
end

  # resources :discussions, only: [:update, :destroy]


resources :discussions, only: [:new, :create, :update, :destroy, :edit, :show] do
    resources :comments, only:[:new, :create, :update, :destroy, :edit]
end

resources :users, only: [:new, :create, :edit, :update]


resources :sessions, only: [:new, :create] do
  delete :destroy, on: :collection
end

get "users/:id/edit_password" => "users#edit_password", as: :edit_password
patch "users/:id/update_password" => "users#update_password"








































  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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

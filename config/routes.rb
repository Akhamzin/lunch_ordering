Rails.application.routes.draw do

  #get 'first_course_item/new'

  #get 'first_course_item/create'

  #get 'menu/index'

  #get 'menu/new'

  get 'menu/create'

  #get 'user_list/index'
  resources :user_order, only: [:index, :new, :create]
  devise_for :users
  get 'dashboard/index'
  resources :user_list, only: :index
  resources :menu, only: [:index, :new, :create, :show] do
    resources :first_course_item, only: [:new, :create]
    resources :main_course_item, only: [:new, :create]
    resources :drink_item, only: [:new, :create]
  end
  root to: "menu#index"
  namespace :api do
    namespace :v1 do
      resources :user_order, only: [:index]
    end
  end
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

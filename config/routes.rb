Cmov1Server::Application.routes.draw do
  resources :appointments

  resources :schedules do
    collection do
      get 'updated'
    end
  end
  
  resources :schedule_plans do
    resources :schedules
    collection do
      get 'updated'
    end
  end

  resources :doctors do
    collection do
      get 'specialities'
      get 'specialities/updated' => 'doctors#updated_specialities'
      get 'updated' => 'doctors#updated'
    end
    member do 
      get 'appointments'
      get 'current_plan'
      get 'current_plans'
      get 'furthest_appointment'
    end
  end

  resources :patients do
    member do 
      get 'appointments'
    end
  end
  
  match 'system/time' => 'application#system_time'
  
  match 'system/auth' => 'application#system_auth'

  match 'system/stats' => 'application#system_stats'
  
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
  # match ':controller(/:action(/:id(.:format)))'
end

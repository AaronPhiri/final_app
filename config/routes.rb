Rails.application.routes.draw do
  

  resources :data_entries do
  collection do
				get :addlocation 
				get :addtribe
				
				get :addencountertype
				get :addencounter
				get :addpatient

				post :createlocation
				post :createtribe
				
				post :createencountertype
				post :createencounter
				post :createpatient

 end
 end

  resources :onlines do
   member do
  get :delete
 end
collection do
								 
	end
 end

  resources :indicators do
 collection do
   get :showindicators
   get :backtoadmin
 end
end

  get 'administrator_page/index' => "administrator_page#index"
 
  get 'access/index'

  get 'access/login'

  get 'administrator_page/managerPage'

  resources :systems do

	end
	resources :users do
   	member 			do
     						get :delete
     end
 			collection do
								 get :retired
								 get :notretired
								 get :getnametosearch
								 get :searchbyname
								 get :summaryofusers
	end
	 end
  resources :users_roles

	resources :roles_users
  resources :users_properties

  resources :drugs

  resources :cohorts_members

  resources :cohorts

  resources :encounters_types

  resources :tribes do
    member do
   					get :delete

 end
  collection do
						get :getall
						get :showall

 end
 end

  resources :patients

  resources :orders

  resources :locations

  resources :people

  resources :encounters do
 					collection do
										 get :encountertypewithtotal
										 get :encounterproviderwithtotal
										 get :encounterperlocation
										 get :patientencountertypepercount
 end
 end

  

  resources :privileges

  resources :priviledes

  resources :roles_privileges

  resources :roles
 match ':controller(/:action(/:id))',:via => [:get,:post]

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

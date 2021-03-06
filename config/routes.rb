Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'
  get "/home", to: "pages#home"
  get "/dev", to: "pages#dev"
  get "/medbot", to: "pages#medbot"
  
  resources :machines
  
  # Physicians
  resources :physicians do
    resources :addresses, module: :physicians, as: :addresses
    resources :phones, module: :physicians, as: :phones
    
    resources :prescriptions, except: [:destroy] do
      get 'search', on: :collection
    end
    member do
      get 'prescribe'
    end
  end
  resources :specialties

  # Patients
  resources :patients do
    resources :addresses, module: :patients, as: :addresses
    resources :phones, module: :patients, as: :phones

    resources :prescriptions, except: [:destroy] do
      get 'search', on: :collection
    end
    
    get 'search', on: :collection
    get 'autocomplete', on: :collection
  end
  
  resources :address_categories, except: [:show]
  resources :phone_categories, except: [:show]
  resources :prescription_categories, except: [:show]


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

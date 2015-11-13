Alumni::Application.routes.draw do

  devise_for :users
  root to: "alumni#index"
  #resources :alumni

  authenticate :user do
    resources :alumni, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :new_alumni, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :photos, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :wwii_memorials, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :trustees, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :memorials, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :nassau_literatures, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :trustees_minutes, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :faculties, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :memorabilia, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :honoraries, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :graduates, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :audio_visuals, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :archboards, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  resources :alumni, only: [:index]
  resources :new_alumni, only: [:index]

  resources :photos, only: [:index]

  resources :wwii_memorials, only: [:index]

  resources :trustees, only: [:index]

  resources :memorials, only: [:index]

  resources :nassau_literatures, only: [:index]

  resources :trustees_minutes, only: [:index]

  resources :faculties, only: [:index]

  resources :memorabilia, only: [:index]

  resources :honoraries, only: [:index]

  resources :graduates, only: [:index]

  resources :audio_visuals, only: [:index]

  resources :archboards, only: [:index]

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

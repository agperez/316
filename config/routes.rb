SampleApp::Application.routes.draw do

  resources :notes
  resources :setlists
  resources :songs
  resources :email_contents

  resources :sermons
  resources :events
  resources :roles
  resources :teams
  resources :users do
    collection { post :import }
  end


  resources :sessions, only: [:new, :create, :destroy]
  root 'sermons#index'

  match '/archive', to: 'sermons#archive', via: 'get'
  match '/search',  to: 'sermons#search',  via: 'get'
  match '/manage', to: 'sermons#manage', via: 'get'

  match '/us', to: 'users#us', via: 'get'
  match '/notesmail', to: 'notes#notes_email', via: 'get'
  match '/returnemail', to: 'email_contents#return_email', via: 'get'
  match '/email', to: 'static_pages#email', via: 'get'
  match '/scheduleemail', to: 'email_contents#schedule_email', via: 'get'

  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  match '/help', to: 'static_pages#help', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/datepicker', to: 'static_pages#datepicker', via: 'get'

  match '/calendar', to: 'roles#calendar2', via: 'get'
  match '/calendarView', to: 'roles#calendarAll', via: 'get'
  match '/dashboard', to: 'static_pages#dashboard', via: 'get'




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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

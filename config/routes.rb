SampleApp::Application.routes.draw do

  resources :notes
  resources :setlists
  resources :songs
  resources :email_contents
  resources :highlights
  resources :sermons
  resources :events
  resources :roles
  resources :teams
  resources :users do
    post :import, on: :collection
    #collection { post :import }
    member do
      get 'profile'
      get 'picture'
    end
  end

  resources :setlist_songs do
    post :sort, on: :collection
  end


  resources :sessions, only: [:new, :create, :destroy]
  root 'sermons#index'

  match '/tag_search', to: 'sermons#tag_search', via: 'get'
  match '/archive', to: 'sermons#archive', via: 'get'
  match '/manage', to: 'sermons#manage', via: 'get'

  match '/setlist_archive', to: 'setlists#archive', via: 'get'

  match '/us', to: 'users#us', via: 'get'
  match '/notesmail', to: 'notes#notes_email', via: 'get'
  match '/returnemail', to: 'email_contents#return_email', via: 'get'
  match '/contactemail', to: 'email_contents#contact_email', via: 'get'
  match '/email', to: 'static_pages#email', via: 'get'
  match '/scheduleemail', to: 'email_contents#schedule_email', via: 'get'


  match '/user', to: 'users#show', via: 'get'
  match '/editpersonal', to: 'users#editpersonal', via: 'get'
  match '/signup', to: 'users#new', via: 'get'
  match '/deactivated', to: 'users#deactivated', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/inactive', to: 'users#inactive', via: 'get'

  match '/datepicker', to: 'static_pages#datepicker', via: 'get'

  match '/calendar', to: 'roles#calendar2', via: 'get'
  match '/calendarView', to: 'roles#calendarAll', via: 'get'
  match '/dashboard', to: 'static_pages#dashboard', via: 'get'

end

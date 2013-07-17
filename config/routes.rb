Manage::Application.routes.draw do
  resources :managers, :only => [:show]
  resources :staff_members, :only => [:show]
  resources :sessions, :only => [:create]
  match 'signin' => 'sessions#new', :as => "signin"
  match 'signout' => 'sessions#destroy', :as => "signout"
  root :to => 'sessions#new'
end

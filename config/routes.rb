Manage::Application.routes.draw do
  resources :managers, :only => [:show]
  resources :staff_members, :only => [:show]
  resources :sessions, :only => [:create]
  match 'login' => 'sessions#new'
end

Folioshine::Application.routes.draw do
  get 'signup',     to: 'users#new',        as: 'signup'
  get 'login',      to: 'sessions#new'      as: 'login'
  delete 'logout',  to: 'sessions#destroy'  as: 'logout'
  
  root to: 'sessions#new'
  
  resources :albums do 
    member do 
      get 'get_pics'
    end
    member do 
      get 'get_html_pics'
    end
    member do 
      get 'invite'
    end
    member do 
      get 'sync_gmail'
    end
  end
  resources :google_contacts
  resource  :inbox, :controller => 'inbox', :only => [:show, :create]
  resources :invitations
  resources :password_resets
  resources :sessions
  resources :stars
  resources :users
  resources :verifications
  
end

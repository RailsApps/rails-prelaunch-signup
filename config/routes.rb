RailsPrelaunchSignup::Application.routes.draw do
  
  authenticated :user do
    root :to => 'home#index'
  end
  devise_scope :user do
    root :to => "devise/registrations#new"
  end
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, :only => :show
end

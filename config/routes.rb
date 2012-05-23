RailsPrelaunchSignup::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  devise_scope :user do
    root :to => "devise/registrations#new"
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, :controllers => { :registrations => "registrations", :confirmations => "confirmations" }
  resources :users, :only => [:show, :index] do
    get 'invite', :on => :member
  end
end
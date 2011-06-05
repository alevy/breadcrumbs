Breadcrumbs::Application.routes.draw do
  resources :locations

  resources :checkins, :except => [:new, :create]

  resources :trips do
    resources :checkins, :only => [:new, :create]
  end

  resources :comments, :only => [:destroy]

  resources :posts do
    resources :comments, :only => [:create]
  end
  
  root :to => "posts#index"
end

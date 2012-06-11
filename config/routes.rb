RailsApp::Application.routes.draw do
  resources :blogs
  root :to => 'blogs#index'
  resources :blogs,
    :only => [:index, :edit]
  #devise_for :users
  match 'false', :to => 'blogs#index'
  match '*path', :to=>'application#error_404'
end

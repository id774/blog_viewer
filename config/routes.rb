RailsApp::Application.routes.draw do
  resources :blogs
  root :to => 'blogs#index'
  resources :blogs,
    :only => [:index, :edit]
  #devise_for :users
  match '*path', :to=>'application#error_404'
end

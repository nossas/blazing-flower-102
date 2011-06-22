MeuRio::Application.routes.draw do

  devise_for :users
  match 'user_root' => 'Admin::Dashboard#index'

  resources :pages, :controller => 'pages', :only => :show

  root :to => "pages#show", :id => "index"

  namespace :admin do
    get "/" => "dashboard#index"
    resources :petitions
    resources :users
  end
end

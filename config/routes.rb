MeuRio::Application.routes.draw do

  devise_for :users

  resources :pages, :controller => 'pages', :only => :show

  root :to => "pages#show", :id => "index"

  namespace :admin do
    get "/" => "dashboard#index"
    resources :petitions
  end
end

MeuRio::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :pages, :controller => 'pages', :only => :show
  root :to => "pages#show", :id => "index"
end

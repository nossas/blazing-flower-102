MeuRio::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  match 'admin_user_root' => 'admin/dashboard#index'

  resources :pages, :controller => 'pages', :only => :show
  root :to => "pages#show", :id => "index"
end

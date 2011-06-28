MeuRio::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  match 'admin_user_root' => 'admin/dashboard#index'

  resources :pages, :controller => 'pages', :only => :show
  match "petition/:custom_path" => "petitions#show", :as => "custom_petition"

  root :to => "pages#show", :id => "index"
end

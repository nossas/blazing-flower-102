MeuRio::Application.routes.draw do
  resources :petition_signatures

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  match 'admin_user_root' => 'admin/dashboard#index'

  resources :pages, :controller => 'pages', :only => :show
  match "petition/:custom_path" => "petitions#show", :as => "custom_petition"
  match "petition/:custom_path/share" => "tafs#show", :as => "custom_taf"

  root :to => "pages#show", :id => "index"
end

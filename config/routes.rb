MeuRio::Application.routes.draw do
  resources :petition_signatures, :only => [:create]

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :members, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  ActiveAdmin.routes(self)
  namespace :admin do
    get 'preview/petition/:id' => "petitions#preview", :as => "preview_petition"
  end

  match 'admin_user_root' => 'admin/dashboard#index'

  resources :pages, :controller => 'pages', :only => :show
  match "petition/:custom_path" => "petitions#show", :as => "custom_petition"
  match "petition/:custom_path/share" => "tafs#show", :as => "custom_taf"

  root :to => "pages#show", :id => "index"
end

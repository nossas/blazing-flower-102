MeuRio::Application.routes.draw do
  resources :petition_signatures, :only => [:create, :index]
  resources :debates, :only => [:show]
  resources :comments, :only => [:create]

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :members, :controllers => { :omniauth_callbacks => "omniauth_callbacks" } do
    get 'logout' => 'devise/sessions#destroy', :as => :destroy_member_session
    post 'google_custom_domain_complete' => 'omniauth_callbacks#google_custom_domain_complete', :as => :google_custom_domain_complete
  end

  ActiveAdmin.routes(self)
  namespace :admin do
    get 'preview/petition/:id' => "petitions#preview", :as => "preview_petition"
    get 'petition/:id/export' => "petitions#export", :as => "export_petition"
    get 'petition/:id/export' => "petitions#export", :as => "export_petition"
  end

  match 'admin_user_root' => 'admin/dashboard#index'

  resources :pages, :controller => 'pages', :only => :show
  match "petition/:custom_path" => "petitions#show", :as => "custom_petition"
  match "petition/:custom_path/share" => "tafs#show", :as => "custom_taf"

  root :to => "pages#show", :id => "index"
end

MeuRio::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :members, :controllers => { :omniauth_callbacks => "omniauth_callbacks" } do
    get 'logout' => 'devise/sessions#destroy', :as => :destroy_member_session
    post 'google_custom_domain_complete' => 'omniauth_callbacks#google_custom_domain_complete', :as => :google_custom_domain_complete
  end

  match 'debates/:id/load_comments/:page' => "debates#load_comments"
  match "petition/:custom_path" => "petitions#show", :as => "custom_petition"
  match "petition/:custom_path/share" => "tafs#show", :as => "custom_taf"
  match "issue/:issue_id/personal-stories" => "personal_stories#issue_index", :as => "issue_personal_stories"
  match "issue/:issue_id/personal-stories/:id" => "personal_stories#issue_index", :as => "issue_personal_story"

  # Ren: I no longer believe this is necessary?
  # match 'admin_user_root' => 'admin/dashboard#index'

  namespace :admin do
    get 'preview/petition/:id' => "petitions#preview", :as => "preview_petition"
    get 'petition/:id/export' => "petitions#export", :as => "export_petition"
    get 'petition/:id/export' => "petitions#export", :as => "export_petition"
  end

  resources :pages, :controller => 'pages', :only => :show
  resources :petition_signatures, :only => [:create, :index]
  resources :issues, :only => [:show]
  resources :debates, :only => [:show]
  resources :personal_stories, :only => [:show]
  resources :comments, :only => [:create] do
    resources :comment_flags, :only => [:create, :destroy], :as => "flags"
  end

  root :to => "pages#show", :id => "index"
end

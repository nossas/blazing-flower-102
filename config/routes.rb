MeuRio::Application.routes.draw do
  mount Doorkeeper::Engine => '/oauth'

  namespace :api do
    namespace :v1 do
      resources :profiles
      get '/me' => "credentials#me"
    end
  end

  unless Rails.env == 'frontend'
    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config
  end




  namespace :admin do
    get 'preview/assine_embaixo/:id' => "petitions#preview", :as => "preview_petition"
    get 'petitions/:id/publish' => "petitions#publish", :as => "publish_petition"
    get 'petitions/:id/archive' => "petitions#archive", :as => "archive_petition"
    get 'petitions/:id/deactivate' => "petitions#deactivate", :as => "deactivate_petition"
    get 'assine_embaixo/:id/export' => "petitions#export", :as => "export_petition"
    get 'assine_embaixo/:id/export' => "petitions#export", :as => "export_petition"
  end

  devise_for :members, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :sessions => "member_sessions", :registrations => "member_registration", :passwords => "member_passwords" } do
    get "sign_in", :to => "devise/sessions#new", :as => :new_member_session
    post "member_session", :to => "devise/sessions#create", :as => :member_session
    get 'logout' => 'member_sessions#destroy', :as => :destroy_member_session
    get 'members/sign_out' => 'member_sessions#destroy', :as => :destroy_member_session
    match 'members/passwords/resend' => 'member_passwords#resend', :as => :member_resend_password
    match '/facebook_logout' => 'member_sessions#facebook_logout', :as => :facebook_logout
    match '/google_logout' => 'member_sessions#google_logout', :as => :google_logout
  end

  match "paginas/:id" => "pages#show", :as => "page"

  match "na_atividade/:id/assine_embaixo/:custom_path" => "petitions#show", :as => "issue_custom_petition"
  match "na_atividade/:id/assine_embaixo/:custom_path/share_with_friends" => "petitions#share_with_friends", :as => "share_with_friends"
  match "na_atividade/:id/assine_embaixo/:custom_path/share" => "tafs#show", :as => "issue_custom_taf"
  match "na_atividade/:id/assine_embaixo/:custom_path/donate" => "petitions#donate", :as => "issue_custom_donate"
  match "assine_embaixo/:custom_path" => "petitions#show", :as => "custom_petition"
  match "assine_embaixo/:custom_path/share" => "tafs#show", :as => "custom_taf"
  resources :petition_signatures, :only => [:create, :index]
  match "na_atividade/:id" => "issues#show", :as => "issue"
  match "na_atividade/:id/arquivo" => "issues#archive", :as => "issue_archive"
  match "na_atividade/:id/arquivo/:page" => "issues#archive", :as => "issue_archive_page"
  match "na_atividade/:issue_id/bate-bola/:id" => "debates#show", :as => "issue_debate"
  match "na_atividade/:issue_id/carta/new" => "letters#new", :as => "issue_letter"
  resources :letters, :only => [:create]
  resources :debates, :only => [:show] do
    resources :comments, :only => [:index]
  end
  match 'debates/:id/load_comments/:page' => "debates#load_comments"
  resources :personal_stories, :only => [:show]
  resources :members, :only => [ :update, :index ]
  match "membros/:id" => "members#show", :as => "member"
  match "na_atividade/:issue_id/direto_da_gema" => "personal_stories#issue_index", :as => "issue_personal_stories"
  match "na_atividade/:issue_id/direto_da_gema/:id" => "personal_stories#issue_index", :as => "issue_personal_story"
  resources :comments, :only => [:create] do
    resources :comment_flags, :only => [:create, :destroy], :as => "flags"
  end

  # Ramify Namespace and routes
  namespace :imagine do
    resources :ideas, :only => [:index, :create, :update, :show, :destroy] do
      collection do
       get "explore"
      end
      member do
        put 'update_likes'
        put 'publish'
        put 'merge'
        get 'review_conflicts/:from_id', :as => :review_conflicts, :action => :review_conflicts
        put 'resolve_conflicts'
        post 'create_fork'
      end
    end
  end

  # Workaround to fix later
  match "imagine/:id" => "Imagine::Ideas#show", :as => :idea

  post "na_atividade/:issue_id/imagine" => "Imagine::Ideas#create", :as => :issue_ideas
  match "na_atividade/:issue_id/imagine/:id" => "Imagine::Ideas#show", :as => :issue_idea
  match "na_atividade/:issue_id/imagine" => "Imagine::Ideas#index", :as => :issue_ideas

  # Api routes
  resources :issues, only: [:index, :show] do
    resources :petition_signatures, path: '/signatures', only: [:index]
  end
  root :to => "pages#show", :id => "index"
end

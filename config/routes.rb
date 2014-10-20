Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions",
      passwords: "users/passwords"
  }, skip: [
      :sessions,
      :registrations
  ]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_scope :user do
    get    "login"   => "users/sessions#new",         as: :new_user_session
    post   "login"   => "users/sessions#create",      as: :user_session
    delete "signout" => "users/sessions#destroy",     as: :destroy_user_session

    get    "signup"  => "users/registrations#new",    as: :new_user_registration
    post   "signup"  => "users/registrations#create", as: :user_registration
    put    "signup"  => "users/registrations#update", as: :update_user_registration
    get    "account" => "users/registrations#edit",   as: :edit_user_registration
  end
  resources :sites do
    collection do
      get :welcome
    end
  end

  resources :events

  get 'widget/:guid', to: 'sites#widget', defaults: { format: 'js' }, as: :widget

  root 'welcome#root'
end

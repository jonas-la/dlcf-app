Rails.application.routes.draw do
  resources :attendances
  get 'main/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # root "main#index"
  root 'dashboards#show'

  resources :officer_dashboard
  resources :member_dashboard
  resources :attendances
  resources :events
  resources :feedbacks
  resources :members 
  resources :orginfos

  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
    devise_scope :admin do
      get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
      get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
    end
end

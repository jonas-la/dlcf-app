Rails.application.routes.draw do
  resources :attendances
  get 'main/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # root "main#index"
  root 'dashboards#show'

  resources :officer_dashboard
  resources :member_dashboard
  resources :attendances
  resources :events do
    collection do
      get 'member_index'
    end
    member do
      get 'member_show'
    end
  end
  resources :feedbacks
  resources :members do
    collection do
      get 'new_account'
      post 'create_account' # Add this line
    end
  end
  resources :orginfos

  get '', to: 'custom_pages#show'

  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
    devise_scope :admin do
      get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
      get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
    end
end

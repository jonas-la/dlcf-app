Rails.application.routes.draw do
  # resources :attendances
  get 'main/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # root "main#index"
  root 'dashboards#show'

  resources :officer_dashboard
  resources :member_dashboard
  resources :attendances  do
    get 'ne2w', on: :collection
    post 'create2', on: :collection
  end
  resources :events do
    resources :attendances, only: [:new, :create]
    collection do
      get 'member_index'
    end
    member do
      get 'member_show'
      get 'schedule_show'
    end
  end
  resources :feedbacks
  resources :members do
    collection do
      get 'new_account'
      post 'create_account' # Add this line
    end
  end
  resources :pending_members do
    collection do
      get 'new_account'
      post 'create_account' # Add this line
    end
  end

  resources :orginfos

  get '', to: 'custom_pages#show'
  get '/event_schedule', to: 'events#event_schedule', as: "event_schedule"


  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
    devise_scope :admin do
      get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
      get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
    end
end

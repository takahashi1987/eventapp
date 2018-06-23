Rails.application.routes.draw do
  get 'tops/index'

  resources :events do
    collection do
      post :confirm
    end
  end
  root 'tops#index'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :participant_managements, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/inbox"
  end
end

Rails.application.routes.draw do

  get 'badge_gettings/show'
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: {sessions: "sessions"}
 
  authenticated :user, lambda {|u| u.type == "Admin"} do
    root to: "admin/tests#index"
  end
  root 'tests#index'

  resources :tests, only: :index do

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  resource :badge_gettings, only: :show

  resource :messages, only: %i[new create]

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
    resources :badges
  end
end

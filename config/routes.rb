Rails.application.routes.draw do
  resources :tests do

    member do
      post :start
    end

    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: :true, except: :index
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end

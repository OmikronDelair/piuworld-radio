Pwr::Application.routes.draw do
  devise_for :users
  root to: "radio#index"
  resources :radio do
    collection do
      get :current_track
    end
  end
end

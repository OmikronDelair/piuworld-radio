Pwr::Application.routes.draw do
  root to: "radio#index"
  resources :radio do
    collection do
      get :track_info
      get :current_track
    end
  end
end

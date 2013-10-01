Pwr::Application.routes.draw do
  devise_for :users, :path => 'djs', :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'password', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'sign_up' }

  root to: "radio#index"
  get 'djs', to: redirect('/djs/login')

  resources :radio do
    collection do
      get :current_track
    end
  end
end

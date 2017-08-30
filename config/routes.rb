Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin, skip: [:sessions, :passwords]



  devise_scope :admin do
    get "/admin/login" => "admin/sessions#new", as: :admin_session
    post "/admin/login" => "admin/sessions#create", as: :admin_login
    get "/admin/logout" => "admin/sessions#destroy", as: :admin_logout
  end

  authenticated do
    devise_scope :admin do
      namespace :admin do
        resources :blogs do
          collection do
            get "/confirm" => "blogs#confirm"
          end
          resources :comments, controller: "blogs/comments", only: [:index, :destroy]
        end
        get "/confirmation" => "blogs#confirm", as: :confirm
        root to: "top_page#show", as: :root
      end
    end
  end

  unauthenticated do
    devise_scope :admin do
      namespace :admin do
        root to: "sessions#new", as: :unauthenticated
      end
    end
  end

  get "/pages/*page", to: "pages#show"
  root "pages#show", page: "home"

  devise_for :users, path: "users", skip: [:sessions], controllers: {registrations: "users/registrations", confirmations: 'users/confirmations'}
  devise_scope :user do
    get "login" => "users/sessions#new", as: :user_session
    post "login" => "users/sessions#create", as: :user_login
    get "logout" => "users/sessions#destroy", as: :user_logout
    put "/users" => "users/registrations#update", as: :edit_user
    resources :comments, only: [:create]
    resources :authors, controller: "authors", only: [:index]

    resources :blogs, controller: "blogs" do
      resources :authors, controller: "blogs/authors", only: [:index]
    end

    post 'reactions/create'
    delete 'reactions/destroy'

    resources :users, only: [:show]
  end
end

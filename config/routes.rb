Rails.application.routes.draw do
  # devise_for :users
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
end

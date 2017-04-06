Rails.application.routes.draw do

  devise_for :users
  root "pages#index"

  # Back-end JSON API
  namespace :api do
    # resources :teachers
    # resources :courses
    # resources :groups
    # post "/teachers/:id/groups"

    post "/teacher/group/course", to: "teacher_group_courses#create"
    delete "/teacher/group/course", to: "teacher_group_courses#destroy"
  end

  get "/test/:id", to: "documents#test"

  resources :courses
  resources :groups
  resources :teachers do
    resources :reports, controller: "teacher_reports" do
      get "/email", to: "teacher_reports#email"
      post "/email", to: "teacher_reports#email_send"
    end
  end

  get "/documents/:filename", to: "documents#show"

  get "/settings", to: "settings#index"
  post "/settings", to: "settings#update"
  put "/settings", to: "settings#update"
  patch "/settings", to: "settings#update"

end
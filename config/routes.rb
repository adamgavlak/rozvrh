Rails.application.routes.draw do

  devise_for :users
  root "pages#index"

  namespace :api do
    post "/teacher/group/course", to: "teacher_group_courses#create"
    delete "/teacher/group/course", to: "teacher_group_courses#destroy"
  end

  resources :symbol
  resources :courses

  get "/groups/import", to: "imports#new"
  post "/groups/import", to: "imports#import"
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
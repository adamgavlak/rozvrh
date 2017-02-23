Rails.application.routes.draw do

  # Back-end JSON API
  namespace :api do
    # resources :teachers
    # resources :courses
    # resources :groups
    # post "/teachers/:id/groups"

    post "/teacher/group/course", to: "teacher_group_courses#create"
    delete "/teacher/group/course", to: "teacher_group_courses#destroy"
  end

  resources :wage_categories
  resources :courses
  resources :groups
  resources :teachers do
    resources :reports, controller: "teacher_reports"
  end


  get "/documents/:filename", to: "documents#show"

end
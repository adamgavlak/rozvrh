Rails.application.routes.draw do

  # Back-end JSON API
  namespace :api do
    resources :teachers
    resources :courses
    resources :groups
  end

end
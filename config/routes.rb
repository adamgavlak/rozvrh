Rails.application.routes.draw do

  # Back-end JSON API
  namespace :api do
    resources :teachers
    resources :groups
  end

end

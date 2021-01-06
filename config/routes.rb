Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users

  namespace :administration do
    root 'dashboard#home'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users

  namespace :administration do
    get '/', to: 'dashboard#home'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

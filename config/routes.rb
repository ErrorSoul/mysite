Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main_pages#main'
  devise_for :admins, controllers: {
    sessions:      'authentication/sessions'
  }

  namespace :admin do
    resource  :dashboard, only: :show
    resources :pages
    resources :funds
  end

  NAMES.each do |name|
    get name.to_sym, to: "main_pages##{name}", as: name
  end

  resources :funds, only: [:index, :show]
end

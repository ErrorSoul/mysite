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
    resources :funds do
      namespace :nested do
        resources :pages, only: :index
        resources :periods
        resources :pieces
      end
    end
  end

  NAMES.each do |name|
    get name.to_sym, to: "main_pages##{name}", as: name
  end

  resources :main_pages, only: :show
  resources :funds, only: [:index, :show]
end

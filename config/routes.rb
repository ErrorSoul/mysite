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

  # pie
  get 'pie/found/:fund_id' => 'graphs#found'
  get 'pie/month1/:fund_id' => 'graphs#month1'
  get 'pie/month3/:fund_id' => 'graphs#month3'
  get 'pie/month6/:fund_id' => 'graphs#month6'
  get 'pie/month12/:fund_id' => 'graphs#month12'

  #pure
  get 'pure/found/:fund_id' => 'graph_pieces#found'
  get 'pure/month1/:fund_id' => 'graph_pieces#month1'
  get 'pure/month3/:fund_id' => 'graph_pieces#month3'
  get 'pure/month6/:fund_id' => 'graph_pieces#month6'
  get 'pure/month12/:fund_id' => 'graph_pieces#month12'

  NAMES.each do |name|
    get name.to_sym, to: "main_pages##{name}", as: name
  end

  resources :main_pages, only: :show
  resources :funds, only: [:index, :show]
end

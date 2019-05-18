Rails.application.routes.draw do

  resources :carts
  resources :invoice_series do
    get 'set_default', on: :collection
  end
#  post 'invoice_series/set_default', to: 'invoice_series#set_default'
  #resources :purchproditemvats
  resources :productpurchasevats do
    get 'update_batches', on: :collection
    get 'update_batches1', on: :collection
  end
  #
  #   get 'update_batches1',  on:
  # :collection
#end

  #   collection do
  #     get '/productpurchasevats/update_batches' => 'productpurchasevats#update_batches', :as => 'update_batches'
	#   end
  # end
  # get 'productpurchasevats#index'
  # get 'productpurchasevats#new'
  # get 'productpurchasevats#update_batches'
  resources :companies
  resources :taxrates
  resources :purchproditemgsts
  resources :productpurchasegsts
  get 'error/index'
  resources :company_select, only: [:index, :create]

  get 'dashboard/index'

  resources :batches
  resources :products
  resources :productcategories
  resources :suppliers
  resources :sales
  resources :customers
  resources :accountjournals
  resources :employees
  resources :departments
  resources :chartaccounts
  resources :accountgroups
  devise_for :users#, except: :destroy
  # devise_for :users do
  #   get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  # end
  resources :users#, only: [:index, :show, :update, :destroy]

  root to: "dashboard#index"
  

  # devise_for :users, skip: [:sessions]
  # as :user do
  #   #get 'users/sign_in', to: 'devise/sessions#new', as: :new_user_session
  #   #post 'signin', to: 'devise/sessions#create', as: :user_session
    # delete 'users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
   #end

  # devise_scope :user do
  #   root :to => "devise/sessions#new"
  # end


 	resources :orders
  resources :settings do
    collection do
      get 'user_settings'
    end
  end

#  get "/orders/new"
#  get "orders/show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

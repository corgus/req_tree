Rails.application.routes.draw do

  # namespace :external do
  #   root to: 'static_pages#home'
  # end

  devise_for :users

  devise_scope :user do

    authenticated :user do
      root to: 'dashboard#show', as: :authenticated_root
    end
    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end

    get 'signup', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
  end

  authenticate :user do

    resources :users
    resources :features do
      member do
        post '/reorder', to: 'features#reorder', as: 'reorder'
      end
    end
    resources :requirements do
      member do
        post '/reorder', to: 'requirements#reorder', as: 'reorder'
      end
    end
    resources :attachments
    resources :trello_cards
    resources :github_issues
    resources :test_cases
    resources :test_records

    # Associations
    # resources :feature_requirements, only: :destroy
    resources :requirement_test_cases, only: :destroy
    resources :test_case_test_records, only: :destroy

    # Autocompletes
    get 'autocomplete_anything',     to: 'autocomplete#anything'
    get 'autocomplete_features',     to: 'autocomplete#features'
    get 'autocomplete_requirements', to: 'autocomplete#requirements'
    get 'autocomplete_test_cases',   to: 'autocomplete#test_cases'

    # Searches
    get 'search_anything',     to: 'search#anything'
    get 'search_features',     to: 'search#features'
    get 'search_requirements', to: 'search#requirements'
    get 'search_test_cases',   to: 'search#test_cases'


    get 'dashboard', to: 'dashboard#show'

  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

Rails.application.routes.draw do
  resources :uploads, only: [:index, :create, :destroy] do
    collection do
      get :list #list_uploads_url
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

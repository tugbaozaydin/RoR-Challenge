Rails.application.routes.draw do
	root 'welcome#index'
	devise_for :users
	resources :users do
    resources :profiles
end
    resources :articles do
        resources :comments
  end
    resources :articles do
        resources :categories
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

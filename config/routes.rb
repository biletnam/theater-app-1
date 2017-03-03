Rails.application.routes.draw do

	resources :movies do
		resources :sales, only: [:new, :create]
	end

	resources :sales, only: [:index, :destroy, :show]

	root 'movies#index'
end

Rails.application.routes.draw do
	resources :sales do
		resources :movies, only: [:index]
	end
	resources :movies

	root 'movies#index'
end

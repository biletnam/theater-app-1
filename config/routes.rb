Rails.application.routes.draw do

	resources :movies 
	resources :showtimes do
		resources :sales, only: [:new, :create]
	end

	resources :sales, only: [:index, :destroy, :show]

	root 'movies#index'
end

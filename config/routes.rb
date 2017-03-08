Rails.application.routes.draw do

	get '/movies/admin', to: 'movies#admin'
	resources :movies 
	resources :auditoria
	resources :showtimes do
		resources :sales, only: [:new, :create]
	end

	resources :sales, only: [:index, :destroy, :show]



	root 'movies#index'

end
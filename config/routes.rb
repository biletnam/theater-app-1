Rails.application.routes.draw do
	resources :sales
	resources :showtimes

	root 'showtimes#index'
end

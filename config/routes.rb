Rails.application.routes.draw do
	resources :recipes
	resources :recipe_steps
	resources :users

	root to: 'sign_in#sign_in'
	get '/sign_in', to: 'sign_in#sign_in', as: 'sign_in'
	post '/log_in', to: 'sign_in#log_in', as: 'log_in'
	delete '/log_out', to: 'sign_in#log_out', as: 'log_out'
end

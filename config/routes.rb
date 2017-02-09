Rails.application.routes.draw do
 	resources :notes
 	devise_for :users
 	resources :users

  	root 'home#top'

  	get '/about' => 'home#about'

	post '/like/:note_id' => 'likes#like', as: 'like'

	delete '/unlike/:note_id' => 'likes#unlike', as: 'unlike'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

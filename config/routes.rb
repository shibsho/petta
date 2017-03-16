Rails.application.routes.draw do
 	resources :notes
 	devise_for :users
 	resources :users, only: [:index, :show, :edit, :update] do
 		member do
 			get :like_notes
 		end
 	end

  	root 'home#top'
  	post '/' => 'home#search', as: 'search'

  	get '/about' => 'home#about'

	post '/like/:note_id' => 'likes#like', as: 'like'

	delete '/unlike/:note_id' => 'likes#unlike', as: 'unlike'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

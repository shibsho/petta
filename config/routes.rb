Rails.application.routes.draw do
 	resources :notes do
    collection do
      get :search
    end
  end
 	devise_for :users
 	resources :users, only: [:show, :edit, :update] do
 		member do
 			get :like_notes
 		end
 	end

  root 'home#top'

  get '/about' => 'home#about'

	post '/like/:note_id' => 'likes#like', as: 'like'

	delete '/unlike/:note_id' => 'likes#unlike', as: 'unlike'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

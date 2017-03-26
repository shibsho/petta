Rails.application.routes.draw do
 	resources :notes do
    collection do
      get :search
    end
  end

 	devise_for :users

 	resources :users, only: [:show, :edit, :update] do
 		member do
      get :notes
 			get :like_notes
      get :following
      get :follower
 		end
 	end

  root 'home#top'

  get '/about' => 'home#about'

	post '/like/:note_id' => 'likes#like', as: 'like'

	delete '/unlike/:note_id' => 'likes#unlike', as: 'unlike'

  post '/follow/:user_id' => 'follow#follow', as: 'follow'
  delete '/unfollow/:user_id' => 'follow#unfollow', as: 'unfollow'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

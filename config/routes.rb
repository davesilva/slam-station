SlamStationNation::Application.routes.draw do
  root 'static#home'

  get '/slam' => 'slam_jams#slam', :as => 'slam'

  # Toggles likes/dislikes for the givem slam_jam
  post 'slam/:id/like' => 'slam_jams#like', :as => 'like_slam'

  # Toggles dislikes/undislikes for the given slam_jam
  post 'slam/:id/dislike' => 'slam_jams#dislike', :as => 'dislike_slam'

  namespace :admin do
    root 'slam_jams#index'

    resources :slam_jams, except: [:show]
  end
end

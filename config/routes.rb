RockScissorsPaper::Engine.routes.draw do
  root :to => 'home#index'
  get 'fight' => 'home#fight'
  post 'rank' => 'home#rank'

  get 'game_2048' => 'other_game#game_2048_index'
end

if RockScissorsPaper.automatic_routes_mount
  Rails.application.routes.draw do
    mount_rock_scissors_paper_routes
  end
end

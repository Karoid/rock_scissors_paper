RockScissorsPaper.setup do |config|
  #if you use devise, this will work correctly
  #write down your user model name!
  config.user_model_name = "user"

  #if you don't want to use default route as /game/rsp, change as false
  #you can bind route like [get 'my/route' => 'rock_scissors_paper/home#index'] in routes.rb
  #config.automatic_routes_mount = false

  #if you want to use /app/veiws/layouts/application.html.erb, then set this value as true
  #config.use_layout = true

  #default model used by RockScissorsPaper
  config.default_model = <%= model_name.camelize %>

  #first point when user start's this game first
  #config.initial_point = 5000
end

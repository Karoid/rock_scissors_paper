module RockScissorsPaper
  if RockScissorsPaper.use_layout
    HomeController = Class.new(::ApplicationController)
  else
    HomeController = Class.new(ApplicationController)
  end

  class HomeController
    before_action 'authenticate_'+RockScissorsPaper.user_model_name+'!'
    def index
      @current_user = send('current_'+RockScissorsPaper.user_model_name) 
    end

    def write
      send('current_'+RockScissorsPaper.user_model_name)
      redirect_to '/'
    end

  end
end

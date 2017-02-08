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
      @my_record = RockScissorsPaper.default_model.where(user_id: @current_user.id).take
      if !@my_record
        @my_record = RockScissorsPaper.default_model.create(user_id: @current_user.id, point: RockScissorsPaper.initial_point)
      end

    end

    def write
      send('current_'+RockScissorsPaper.user_model_name)
      redirect_to '/'
    end

  end
end

# 이 파일은 engine에 걸려있지 않습니다. 이 파일은 lib/rock_scissors_paper.rb 파일에 require로 연결되어 호출됩니다.
module RockScissorsPaper
  module PointHelper
    def change_points(points)
      @current_user = send('current_'+RockScissorsPaper.user_model_name)
      @my_record = RockScissorsPaper.default_model.where(user_id: @current_user.id).take
      init_point
      @my_record.point += points
      if @my_record.point >= 0
        @my_record.save
      else
        @my_record.point = 0
        @my_record.save
        return false
      end
    end
    def set_points(points)
      @current_user = send('current_'+RockScissorsPaper.user_model_name)
      @my_record = RockScissorsPaper.default_model.where(user_id: @current_user.id).take
      init_point
      @my_record.point = points
      @my_record.save
      puts "#{@current_user.username} points changed! #{@my_record.point - points}=>#{points}"
    end
    def current_points
      @current_user = send('current_'+RockScissorsPaper.user_model_name)
      return RockScissorsPaper.default_model.where(user_id: @current_user.id).take.point
    end

    def current_user_name_by_id(user_id)
      user_record = RockScissorsPaper.user_model_name.camelize.constantize.where(id:user_id)[0]
      if user_record
        if user_record.username
          user_record.username
        else
          user_record.email
        end
      else
        user_record = "Undefined"
      end
    end
    private

    def init_point
      if !@my_record
        @my_record = RockScissorsPaper.default_model.create(user_id: @current_user.id, point: RockScissorsPaper.initial_point)
      end
    end
  end


  ActiveSupport.on_load(:action_controller) do
    ::ActionController::Base.send(:include, RockScissorsPaper::PointHelper)
    #밑에 줄을 포함하면 controller 상에서 함수를 사용할 수 있게 됩니다
    include RockScissorsPaper::PointHelper
  end
end

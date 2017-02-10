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

    def fight
      @current_user = send('current_'+RockScissorsPaper.user_model_name)
      @my_record = RockScissorsPaper.default_model.where(user_id: @current_user.id).take
      if @my_record.point < params[:bet].to_i || params[:bet].to_i < 0
        respond_to do |format|
          format.json { render json: [@my_record.attributes,arr[com_sel],2] }
        end
        return 0
      end
      arr = ["scissor","rock","paper"]
      com_sel = rand(0..2)
      number = (arr.index(params[:selection]) - com_sel)%3
      result = 0
      if number == 2
        #computer wins
        @my_record.point -= params[:bet].to_i
        @my_record.lose += 1
        @my_record.save
        result = -1
      elsif number == 1
        #player win
        @my_record.point += params[:bet].to_i
        @my_record.win += 1
        @my_record.save
        result = 1
      else
        #draw
      end
      respond_to do |format|
        format.json { render json: [@my_record.attributes,arr[com_sel],result] }
      end
    end

  end
end

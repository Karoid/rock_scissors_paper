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

      #get rank record
      raw_rank = RockScissorsPaper.default_model.order(point: :desc)
      @rank_record = raw_rank.limit(3)
      @my_rank = raw_rank.pluck(:user_id).index(@current_user.id)
      @rank_point = @rank_record.map { |x| x.point }
      @rank_name = @rank_record.map { |x| current_user_name_by_id(x.user_id) if current_user_name_by_id(x.user_id) }
    end

    def fight
      @current_user = send('current_'+RockScissorsPaper.user_model_name)
      @my_record = RockScissorsPaper.default_model.where(user_id: @current_user.id).take
      if @my_record.point < params[:bet].to_i || params[:bet].to_i < 0
        respond_to do |format|
          format.json { render json: [@my_record.attributes,nil,2] }
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

    def rank
      @rank = Hash.new
      raw = RockScissorsPaper.default_model.order(point: :desc)
      raw.each do |x|
        @rank[current_user_name_by_id(x.user_id)] = x.point
      end
      respond_to do |format|
        format.json { render json: @rank }
      end
    end

  end
end

module RockScissorsPaper
  class HomeController < ::ApplicationController

    def index
    end

    def write
      puts send('current_'+RockScissorsPaper.user_model_name).id
    end


  end
end

module RockScissorsPaper
  if RockScissorsPaper.use_layout
    OtherGameController = Class.new(::ApplicationController)
  else
    OtherGameController = Class.new(ApplicationController)
  end

  class OtherGameController
    def game_2048_index

    end
  end
end

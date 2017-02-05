module ActionDispatch::Routing
  class Mapper
    def mount_rock_scissors_paper_routes(options = {})
      mount RockScissorsPaper::Engine => '/game/rsp', :as => options[:as] || 'rock_scissors_paper'
    end
  end
end

module ActionDispatch::Routing
  class Mapper
    def mount_rock_scissor_papper_routes(options = {})
      mount RockScissorPapper::Engine => '/game/rsp', :as => options[:as] || 'rock_scissor_papper'
    end
  end
end

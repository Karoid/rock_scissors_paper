RockScissorPapper::Engine.routes.draw do
  root :to => 'home#index'
end

if RockScissorPapper.automatic_routes_mount
  Rails.application.routes.draw do
    mount_rock_scissor_papper_routes
  end
end

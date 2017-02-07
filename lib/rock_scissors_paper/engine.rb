module RockScissorsPaper
  class Engine < ::Rails::Engine
    isolate_namespace RockScissorsPaper
    config.autoload_paths += Dir["#{config.root}/lib"]

    initializer 'any_login.assets_precompile', :group => :all do |app|
      app.config.assets.precompile += ['rock_scissors_paper/*']
    end
  end
end

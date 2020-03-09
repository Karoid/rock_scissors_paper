module RockScissorsPaper
  class Engine < ::Rails::Engine
    isolate_namespace RockScissorsPaper
    config.autoload_paths += Dir["#{config.root}/lib"]

    initializer 'rock_scissors_paper.assets.precompile', :group => :all do |app|
      app.config.assets.precompile += ['rock_scissors_paper/manifest.js']
    end
  end
end

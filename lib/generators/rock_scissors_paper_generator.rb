module RockScissorsPaper
  module Generators
    class RockScissorsPaperGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      hook_for :orm
      def generate_rock_scissors_paper
        copy_file 'initialize.rb', 'config/initializers/rock_scissors_paper.rb'
      end
    end
  end
end

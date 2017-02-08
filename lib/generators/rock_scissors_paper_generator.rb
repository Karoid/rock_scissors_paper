module RockScissorsPaper
  module Generators
    class RockScissorsPaperGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :model_name, :type => :string, :default => "point"
      hook_for :orm
      def generate_rock_scissors_paper
        template 'initialize.rb', 'config/initializers/rock_scissors_paper.rb'
      end
    end
  end
end

module RockScissorsPaper
  module Generators
    class RockScissorsPaperGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_rock_scissors_paper
        copy_file 'migrate.rb', 'db/migrate/rock_scissors_paper.rb'
      end
    end
  end
end

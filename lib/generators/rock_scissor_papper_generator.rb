module RockScissorPapper
  module Generators
    class RockScissorPapperGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_rock_scissor_papper
        copy_file 'migrate.rb', 'db/migrate/rock_scissor_papper.rb'
      end
    end
  end
end

require 'rails/generators/active_record'
require 'generators/rock_scissors_paper/orm_helpers'

module ActiveRecord
  module Generators
    class RockScissorsPaperGenerator < ActiveRecord::Generators::Base
      argument :attributes, type: :array, default: [], banner: "field:type field:type"
      include RockScissorsPaper::Generators::OrmHelpers
      source_root File.expand_path("../templates", __FILE__)

      def copy_rock_scissors_paper_migration
        if (behavior == :invoke && model_exists?) || (behavior == :revoke && migration_exists?(table_name))
          migration_template "migration_existing.rb", "db/migrate/add_rock_scissors_paper_to_#{table_name}.rb", migration_version: migration_version
        else
          migration_template "migration.rb", "db/migrate/rock_scissors_paper_create_#{table_name}.rb", migration_version: migration_version
        end
      end

      def generate_model
        invoke "active_record:model", [name], migration: false unless model_exists? && behavior == :invoke
      end

      def inject_devise_content
        content = model_contents

        class_path = if namespaced?
          class_name.to_s.split("::")
        else
          [class_name]
        end

        indent_depth = class_path.size - 1
        content = content.split("\n").map { |line| "  " * indent_depth + line } .join("\n") << "\n"

        inject_into_class(model_path, class_path.last, content) if model_exists?
      end

      def migration_data
<<RUBY
      ## Database authenticatable
      t.integer :user_id,              null: false
      t.integer :point,                null: false, default: 5000
      t.integer :win,                null: false, default: 0
      t.integer :lose,                null: false, default: 0

RUBY
      end

      def inet?
        postgresql?
      end

      def rails5?
        Rails.version.start_with? '5'
      end

      def postgresql?
        config = ActiveRecord::Base.configurations[Rails.env]
        config && config['adapter'] == 'postgresql'
      end

     def migration_version
       if rails5?
         "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
       end
     end
    end
  end
end

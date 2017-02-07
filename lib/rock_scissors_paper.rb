require "rails"

module RockScissorsPaper

  # automatic engine routes mouting
  mattr_accessor :automatic_routes_mount
  @@automatic_routes_mount = true

  mattr_accessor :user_model_name

  def self.use_default_configuration!
    self.automatic_routes_mount             = true
    self.enabled                            = true
  end

  # Default way to set up Devise. Run rails generate devise_install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end

  include Devise::Controllers::Helpers::ClassMethods

  class Engine < ::Rails::Engine
    isolate_namespace RockScissorsPaper
  end

end

require "rock_scissors_paper/version"
require "rock_scissors_paper/engine"
require_relative "rails/routes"

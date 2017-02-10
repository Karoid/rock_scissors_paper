require "rails"

module RockScissorsPaper

  # automatic engine routes mouting
  mattr_accessor :automatic_routes_mount
  @@automatic_routes_mount = true

  mattr_accessor :user_model_name
  @@user_model_name = 'user'

  mattr_accessor :use_layout
  @@use_layout = false

  mattr_accessor :default_model

  mattr_accessor :initial_point
  @@initial_point = 5000

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
require_relative "../app/helpers/rock_scissors_paper/point_helper"
require_relative "rails/routes"

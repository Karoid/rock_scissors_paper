require "rails"

module RockScissorPapper

  # automatic engine routes mouting
  mattr_accessor :automatic_routes_mount
  @@automatic_routes_mount = true

  def self.use_default_configuration!
    self.automatic_routes_mount             = true
    self.enabled                            = true
  end

  class Engine < ::Rails::Engine
    isolate_namespace RockScissorPapper
  end

end

require "rock_scissor_papper/version"
require_relative "rails/routes"

# frozen_string_literal: true

require "gruf"
require_relative "protos/Wines_pb"
require_relative "protos/Wines_services_pb"

require_relative "wineskills/version"
require_relative "wineskills/cli"

module Wineskills
  class Error < StandardError; end
  # Your code goes here...
end

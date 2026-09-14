# frozen_string_literal: true

require 'active_model'
require 'active_support/concern'
require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/array/extract_options'
require 'active_support/core_ext/object/blank'
require 'zeitwerk'

# Autoload gem internals.
Zeitwerk::Loader.for_gem.setup

# Top-level module
module Voids
  # Custom exception wrapper
  class Error < StandardError; end
end

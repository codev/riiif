module Riiif
  class Engine < ::Rails::Engine
    require 'riiif/rails/routes'

    # How long to cache the tiles for.
    config.cache_duration_in_days = 3
    
    # Allow slashes for identifiers to allow files to be served from subdirectories
    config.allow_filename_slashes = false
  end
end

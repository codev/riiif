module Riiif
  class FileSystemFileResolver
    attr_accessor :root, :base_path, :input_types

    def initialize
      @root = ::File.expand_path(::File.join(::File.dirname(__FILE__), '../..'))
      @base_path = ::File.join(root, 'spec/samples')
      @input_types = %W{png jpg tiff jp jp2}
    end

    def find(id)
      Riiif::File.new(path(id))
    end

    def path(id)
      search = pattern(id)
      Dir.glob(search).first || raise(ImageNotFoundError, search)
    end


    def pattern(id)
      if ::Riiif::Engine.config.allow_filename_slashes
        # Hack to allow subdirectories to be passed in by substituting slashes for pipes
        id.gsub!("|", "/")
        valid_pattern = /^[\w\-:\/]+$/
      else
        valid_pattern = /^[\w\-:]+$/
      end
      raise ArgumentError, "Invalid characters in id `#{id}`" unless valid_pattern.match(id)
      ::File.join(base_path, "#{id}.{#{input_types.join(',')}}")
    end

  end
end

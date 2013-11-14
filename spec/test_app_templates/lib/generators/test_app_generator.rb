require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root "spec/test_app_templates"

  def add_routes
    route "mount Riiif::Engine => '/image-service'"
  end

end

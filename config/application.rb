require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)

module Recipes
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    # Add Bower managed packages to assets path
    config.assets.paths << Rails.root.join('vendor', 'assets', 'components')
  end
end

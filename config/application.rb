require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Testbook
  class Application < Rails::Application
    config.generators do |generate|
      generate.orm :active_record, primary_key_type: :uuid
      #generate.orm :active_record, foreign_key_type: :uuid

    end
  end
end

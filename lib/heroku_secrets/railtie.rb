require "rails"

module HerokuSecrets
  class Railtie < ::Rails::Railtie
    config.before_configuration do |app|
      app.class.send(:include, HerokuSecrets::Application)
      app.reload_secrets!
    end

    rake_tasks do
      load "heroku_secrets/tasks.rake"
    end
  end
end
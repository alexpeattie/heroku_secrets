require "rails"

module HerokuSecrets
  class Railtie < ::Rails::Railtie
    config.after_initialize do |app|
      app.class.send(:include, HerokuSecrets::Application)
    end

    rake_tasks do
      load "heroku_secrets/tasks.rake"
    end
  end
end
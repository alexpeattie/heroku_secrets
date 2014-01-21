require "rails"

module HerokuSecrets
  class Railtie < ::Rails::Railtie
    config.after_initialize do |app|
      app.class.send(:include, HerokuSecrets::Application)
    end

    rake_tasks do
      load "heroku_secrets/tasks.rake"
    end

    config.to_prepare do
      if Rails.application.respond_to? :reload_secrets!
        Rails.application.reload_secrets!
      end
    end
  end
end
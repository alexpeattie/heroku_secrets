require "heroku_secrets/version"
require "heroku_secrets/railtie"
require "heroku_secrets/application"
require "heroku_secrets/tasks"
require "shellwords"

module HerokuSecrets
  extend self

  def vars
    Rails.application.secrets.map { |key, value|
      key = "_SECRET_#{key}".upcase

      "#{key}=#{Shellwords.escape(value)}"
    }.join(" ")
  end
end

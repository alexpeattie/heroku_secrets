require 'timeout'


namespace :heroku do
  desc "Configure Heroku according to secrets.yml"
  task :secrets, [:app] => :environment do |_, args|
    begin
      Timeout::timeout(20) {
        HerokuSecrets::Tasks::Heroku.new(args[:app]).invoke
      }
    rescue Timeout::Error
      fail "Error: timeout connecting to Heroku. Ensure you've logged in with `heroku login`."
    end
  end

  desc "Reload the secrets from the ENV variables"
  task :reload_secrets => :environment do
    Rails.application.reload_secrets!
  end
end
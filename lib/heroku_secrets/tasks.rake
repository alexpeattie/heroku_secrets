require 'timeout'


namespace :heroku do
  desc "Configure Heroku according to secrets.yml"
  task :secrets, [:app] => :environment do |_, args|
    begin
      Timeout::timeout(10) {
        HerokuSecrets::Tasks::Heroku.new(args[:app]).invoke
      }
    rescue Timeout::Error
      fail "Error: timeout connecting to Heroku. Ensure you've logged in with `heroku login`."
    end
  end
end
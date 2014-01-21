require "bundler"

module HerokuSecrets
  module Tasks
    class Heroku < Struct.new(:app)
      def invoke
        # Rails.env = environment || 'production'
        output = heroku("config:set #{vars}")

        puts output.split("\n").first
      end

      def environment
        heroku("run 'echo $RAILS_ENV'").chomp[/(\w+)\z/]
      end

      def vars
        HerokuSecrets.vars
      end

      def heroku(command, show_errors = false)
        with_app = app ? " --app #{app}" : ''
        err = show_errors ? '' : ' 2>/dev/null'
        `heroku #{command}#{with_app}#{err}`
      end

      def `(command)
        Bundler.with_clean_env { super }
      end
    end
  end
end
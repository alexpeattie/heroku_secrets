module HerokuSecrets
  module Application
    def self.included base

      base.class_eval do
        alias_method(:secrets_from_yaml, :secrets)

        def secrets
          return @secrets if @secrets && @secrets.secret_key_base
          @secrets = begin
            secrets = secrets_from_yaml

            ::ENV.select { |var|
              var.start_with? '_SECRET_'
            }.each { |var, val|
              secrets[var.sub(/^_SECRET_/, '').downcase] = val
            }

            secrets
          end
        end

        def reload_secrets!
          @secrets = nil
          secrets
        end
      end

    end
  end
end
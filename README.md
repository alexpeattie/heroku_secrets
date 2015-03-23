# HerokuSecrets

A gem that sets the secret_key_base in the config/secrets.yml file securely when pushing to Heroku, without including the secrets.yml file on GitHub.

## Installation

Add this line to your application's Gemfile:

    gem 'heroku_secrets', github: 'alexpeattie/heroku_secrets'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install heroku_secrets

## Usage

To push secrets to Heroku in Rails:

```sh
bin/rake heroku:secrets[app-name] RAILS_ENV=production
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

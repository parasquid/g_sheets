# GSheets

A Google Sheets api adapter in ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'g_sheets'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install g_sheets

## Usage

### Configuration

We're using the `dotenv` gem so you can just place your environment variables inside a file called `.env` and add that file to your `.gitignore` list; that way your authentication keys are kept safe.

If you wish to access user's data, you will need to create credentials for an `OAuth client ID`. Please see the [documentation](https://developers.google.com/identity/protocols/OAuth2) on how to get the client id and secret.

### Getting the an OAuth token from Google

In order to make operations on a user's Google Spreadsheet you will need an authentication token. There is a sample console OAuth token generator available in `GSheets::Oauth`

```ruby
  CLIENT_ID = ENV["CLIENT_ID"]; CLIENT_SECRET = ENV["CLIENT_SECRET"]
  authenticator = GSheets::Oauth::Offline.new(CLIENT_ID, CLIENT_SECRET)
  uri = authenticator.get_authentication_uri

  puts "Please open #{uri.to_s} in your browser, accept the permissions, and copy-paste the code"
  code = $stdin.gets.chomp

  refresh_token = authenticator.get_refresh_token(authentication_code: code)
  access_token = authenticator.get_access_token(refresh_token: refresh_token)
```

Save the `refresh_token` somewhere safe, as it would be used later to create a new `get_access_token` when that expires.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

You can also run `bundle exec rake console` to get a `pry` console running with all files required.

Please see the [documentation](https://developers.google.com/sheets/api/v3/data) on the sheets api if you'd like to add more functionality :)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/parasquid/g_sheets.

TODO:
  * Ability to include a module into a class and magically give it crud properties:
    * .where
    * .find
    * .create
    * .order
    * .delete
  * Documentation and guides on how to use standalone
  * Documentation and guides on how to use with Rails

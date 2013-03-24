# Omniauth Xero

[Omniauth Xero](https://github.com/kaleworsley/omniauth-xero) is an [OmniAuth](https://github.com/intridea/omniauth) authentication strategy for [Xero](http://www.xero.com).

## Installation

Add this to your application's Gemfile:

```ruby
gem 'omniauth', '~> 1.0.0'
gem 'omniauth-xero'
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install omniauth-xero
```

## Usage

Register your public application on the [Xero API site](https://api.xero.com/Application/Add).

For a Rack application:

```ruby
use OmniAuth::Builder do
  provider :xero, CONSUMER_KEY, CONSUMER_SECRET
end
```

For a Rails application:

```ruby
# config/intializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :xero, CONSUMER_KEY, CONSUMER_SECRET
end
```

Or, if you use [devise](https://github.com/plataformatec/devise) for authentication:

```ruby
# config/initializers/devise.rb
Devise.setup do |config|
  config.omniauth :xero, CONSUMER_KEY, CONSUMER_SECRET
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2013 Kale Worsley. See [LICENSE.txt](LICENSE.txt) for details.

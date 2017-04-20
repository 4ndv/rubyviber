# Rubyviber

Rubyviber is a small Faraday-based library to communicate with Viber Bots REST API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubyviber'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubyviber

## Usage

At first, require rubyviber in your application like this:

```ruby
require 'rubyviber'
```

Create client with your token:

```ruby
client = Rubyviber::Client.new 'TOKENHERE'
```

And then make your requests like this:

```ruby
resp = client.send_message receiver: '1234/AbC=', type: 'text', text: 'hello, machine world!'
```

Also you can use `call` method:

```ruby
resp = client.call 'send_message', receiver: '1234/AbC=', type: 'text', text: 'Hi!'
```

You can see parsed response of all requests like this. Resp contains full Faraday response:

```ruby
resp.body
```

Note that in case of errors, exception will be raised, so don't forget to handle it

## Options

Rubyviber Client has some options you can set, here's full list:

```ruby
client = Rubyviber::Client.new 'TOKENHERE', adapter: Faraday.default_adapter, logging: true, raise_errors: true
```

Where:

`adapter` - faraday adapter, look into faraday docs for more of them

`logging` - true/false, enables/disables logging

`raise_errors` - true/false, enables/disables error raising. If you disable this, you can check successfullness of request by verifying `ok` field in the parsed body

## TODO

* Write specs
* Write examples

## Development

After checking out the repo, run `bin/setup` to install dependencies.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/4ndv/rubyviber. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

